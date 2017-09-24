#test for connection html and python

from bottle import *
import pymysql as db
import settings


def connection():
    ''' Use this function to create your connections '''
    con = db.connect(
        settings.host,
        settings.mysql_user, 
        settings.mysql_passwd, 
        settings.mysql_schema,
        charset='utf8mb4',
        cursorclass=db.cursors.DictCursor)
    return con



@route('')
@route('/')
@route('/main')
@route('/main/')
def main():

    return template('./view/main.tpl')


@route('/artist_req', method='GET')
@route('/artist_req/', method='GET')
def artist_req():
    if request.GET.get('art_req','').strip():
        fName = request.GET.get('fName','').strip()
        lName = request.GET.get('lName','').strip()
        fBirth = request.GET.get('fBirth','').strip()
        tBirth = request.GET.get('tBirth','').strip()
        artType = request.GET.get('artType','').strip()
        
        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

        ####################################################################################
        #Logic to redact SQL query
        query = "SELECT DISTINCT ar_taut, onoma, epitheto, etos_gen FROM kalitexnis"
        if artType == "singer":
            query += ", singer_prod WHERE ar_taut=tragoudistis"
            if fName!="" or lName!="" or fBirth!="" or tBirth!="":
                query += " AND"
        elif artType == "songWriter":
            query += ", tragoudi WHERE ar_taut=stixourgos"
            if fName!="" or lName!="" or fBirth!="" or tBirth!="":
                query += " AND"
        elif artType == "composer":
            query += ", tragoudi WHERE ar_taut=sinthetis"
            if fName!="" or lName!="" or fBirth!="" or tBirth!="":
                query += " AND"
        else:
            if fName!="" or lName!="" or fBirth!="" or tBirth!="":
                query += " WHERE"
            
        if fName != "":
            query += " onoma='"+fName+"'"
            if lName!="" or fBirth!="" or tBirth!="":
                query += " AND"
        if lName != "":
            query += " epitheto='"+lName+"'"
            if fBirth!="" or tBirth!="":
                query += " AND"
        if fBirth != "":
            query += " etos_gen>="+fBirth
            if tBirth!="":
                query += " AND"
        if tBirth != "":
            query += " etos_gen<="+tBirth
        ####################################################################################
            
        try:
            # Execute the SQL command
            cur.execute(query)
            # Fetch all the rows in a list of lists
            res_art = cur.fetchall()

            # Add color and url attributes on each node of returned list
##            i = 1
            for record in res_art:
##                record['color']=i%2
                try:
                    record['url']="?natId="+record['ar_taut']+"&fName="+record['onoma']+"&lName="+record['epitheto']+"&birth="+str(record['etos_gen'])
                except:
                    pass
                try:
                    record['url']="?natId="+record['ar_taut']+"&fName="+str(record['onoma'])+"&lName="+record['epitheto']+"&birth="+str(record['etos_gen'])
                except:
                    pass
##                i+=1
    
            output = template('./view/artist_res', rows=res_art)

        except:
            print "Error: unable to fecth data"

        cur.close()
        # disconnect from server
        con.close()
    
        return output

    else:
        return template('./view/artist_req')


@route('/artist_upd', method='GET')
@route('/artist_upd/', method='GET')
def artist_upd():
    
    if request.GET.get('art_upd','').strip():
        natId = request.GET.get('natId','').strip()
        fName = request.GET.get('fName','').strip()
        lName = request.GET.get('lName','').strip()
        birth = request.GET.get('birth','').strip()

        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

        # Redact SQL query
        query = "UPDATE kalitexnis SET onoma=%s, epitheto=%s, etos_gen=%s WHERE ar_taut=%s"
        try:
            # Execute the SQL command
            cur.execute(query, (fName,lName,int(birth),natId))
            # Commit changes in the database
            con.commit()
            return '''<script>alert("Record updated")</script>'''
            
        except:
            # Rollback in case there is any error
            con.rollback()
            return '''<script>alert("Record did not updated")</script>'''

        finally:
            cur.close()
            # disconnect from server
            con.close()
            return template('./view/main')
        
    else:
        natId = request.GET.get('natId','').strip()
        fName = request.GET.get('fName','').strip()
        lName = request.GET.get('lName','').strip()
        birth = request.GET.get('birth','').strip()
        
        output = template('./view/artist_upd', fName=fName,lName=lName,birth=birth,natId=natId)
        return output


@route('/song_req', method='GET')
@route('/song_req/', method='GET')
def song_req():

    if request.GET.get('song_req','').strip():
        song_title = request.GET.get('song_title','').strip()
        prod_year = request.GET.get('prod_year','').strip()
        company = request.GET.get('company','').strip()

        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

        # Redact SQL query
        query = "SELECT titlos, tragoudistis, sinthetis, stixourgos, code_cd, etaireia, etos FROM tragoudi, cd_production, singer_prod WHERE titlos=title AND code_cd=cd"
        if song_title != "":
            query += " AND titlos='"+song_title+"'"
        if prod_year != "":
            query += " AND etos="+prod_year
        if company != "":
            query += " AND etaireia='"+company+"'"

        try:
            # Execute the SQL command
            cur.execute(query)
            # Fetch all the rows in a list of lists
            res_sng = cur.fetchall()

            # Add color attribute on each node of returned list
            i = 1
            for record in res_sng:
                record['color']=i%2
                i+=1
    
            output = template('./view/song_res', rows=res_sng)
            
        except:
            print "Error: unable to fecth data"
            
        cur.close()
        # disconnect from server
        con.close()
    
        
        return output

    else:
        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

        # Redact SQL query
        query = "SELECT DISTINCT etaireia FROM cd_production ORDER BY etaireia"
        # Execute the SQL command
        cur.execute(query)
        # Fetch all the rows in a list of lists
        res_cmp = cur.fetchall()

        cur.close()
        # disconnect from server
        con.close()

        output = template('./view/song_req', comp_list=res_cmp)
        return output


@route('/artist_ins', method='GET')
@route('/artist_ins/', method='GET')
def artist_ins():

    if request.GET.get('art_ins','').strip():
        natId = request.GET.get('natId','').strip()
        fName = request.GET.get('fName','').strip()
        lName = request.GET.get('lName','').strip()
        birth = request.GET.get('birth','').strip()

        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

        # Redact SQL query
        query = "INSERT INTO kalitexnis (ar_taut, onoma, epitheto, etos_gen) VALUES (%s,%s,%s,%s)"
        try:
            # Execute the SQL command
            cur.execute(query, (natId,fName,lName,int(birth)))
            # Commit changes in the database
            con.commit()
            return '''<script>alert("New artist inserted!")</script>'''
            
        except:
            # Rollback in case there is any error
            con.rollback()
            return '''<script>alert("New artist did not inserted!")</script>'''
            
        finally: 
            cur.close()
            # disconnect from server
            con.close()
            return template('./view/main')
    
    else:
        return template('./view/artist_ins')
    

@route('/song_ins', method='GET')
@route('/song_ins/', method='GET')
def song_ins():

    if request.GET.get('sng_ins','').strip():
        title = request.GET.get('title','').strip()
        year = request.GET.get('year','').strip()
        code_cd = request.GET.get('code_cd','').strip()
        singer = request.GET.get('singer','').strip()
        composer = request.GET.get('composer','').strip()
        songWriter = request.GET.get('songWriter','').strip()

        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

##        try:
        # Redact SQL query
        query = "INSERT INTO tragoudi (titlos, sinthetis, etos_par, stixourgos) VALUES (%s,%s,%s,%s)"
        # Execute the SQL command
        cur.execute(query, (title,composer,int(year),songWriter))
        # Commit changes in the database
        con.commit()
##        
##        except:
##            # Rollback in case there is any error
##            con.rollback()
##            return '''<script>alert("New song did not inserted!1")</script>'''
##
##        try:
        # Redact SQL query
        query = "INSERT INTO singer_prod (cd, tragoudistis, title) VALUES (%s,%s,%s)"
        # Execute the SQL command
        cur.execute(query, (int(code_cd),singer,title))
        # Commit changes in the database
        con.commit()
##            return '''<script>alert("New song inserted!")</script>'''
##        
##        except:
##            # Rollback in case there is any error
##            con.rollback()
##            return '''<script>alert("New song did not inserted!")</script>'''
##
##        finally:
        cur.close()
        # disconnect from server
        con.close()
        return template('./view/main')
        
    else:
        # Open database connection
        con = connection()
        # prepare a cursor object using cursor() method
        cur = con.cursor()

        # Redact SQL query
        query = "SELECT code_cd FROM cd_production ORDER BY code_cd"
        # Execute the SQL command
        cur.execute(query)
        # Fetch all the rows in a list of lists
        res_cd = cur.fetchall()

        # Redact SQL query
        query = "SELECT ar_taut FROM kalitexnis ORDER BY ar_taut"
        # Execute the SQL command
        cur.execute(query)
        # Fetch all the rows in a list of lists
        res_art = cur.fetchall()

        cur.close()
        # disconnect from server
        con.close()

        output = template('./view/song_ins', code_cds=res_cd, arts_id=res_art)
        return output


@error(403)
def mistake403(code):
    return 'There is a mistake in your url!'


@error(404)
def mistake404(code):
    return 'Sorry, this page does not exist!'


@error(500)
def mistake500(code):
    return 'Sorry, there is an error in our server!'


##run(host=settings.host, port=settings.web_port, debug=True)
run(host=settings.host, port=settings.web_port)
