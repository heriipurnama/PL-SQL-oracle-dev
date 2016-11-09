create or replace 
PROCEDURE CONTOH(
	plsql_member varchar2 default null, 
	machine_language varchar2 default null, 
	description varchar2 default null, 
	human_language varchar2 default null, 
	example varchar2 default null, 
	status varchar2 default null, 
	time date default sysdate, 
	author varchar2 default null, 
	id number default null, 
	action varchar2 default null) 
AS 
  
  num number(38) :=0;
  cursor data1 is select * from table_pembelajaran where id = id;
  
BEGIN
  
  if (action = 'insert') then 
    insert into table_pembelajaran(id,
                                   plsql_member,
                                   machine_language,
                                   description,
                                   human_language,
                                   example,
                                   status,
                                   time,
                                   author)
    values (sequence_pembelajaran.nextval, 
            plsql_member, 
            machine_language, 
            description, 
            human_language, 
            example, 
            status, 
            to_timestamp(sysdate,'YYYY-MM-DD HH24:MI:SS'),
            author);
  elsif (action = 'delete') then 
    delete from table_pembelajaran 
    where id=id;
  elsif (action = 'update') then 
    update table_pembelajaran 
    set plsql_member = plsql_member, 
        machine_language = machine_language, 
        description = description, 
        human_language = human_language, 
        example = example, 
        status = status, 
        time = sysdate, 
        author = author 
    where id = id;
  end if;
  
  htp.p('
    <!doctype html>
    <html>
      <head>
        <title>pAnji idOLakU</title>
      </head>
      <body>
        Name : panji idolaku<br />
        Motto : <blockquote><i>"kecil senang main-main, muda bebas foya-foya, tua santai kaya-raya, mati tenang masuk surga"</i></blockquote>
        <hr />
        <form method="get" action="contoh">        
  ');
  
  if (action = 'edit') then
    for x in data1
    loop
      htp.p(' 
              <fieldset>
                <legend>Form Update Materi Pembelajaran</legend>
                  <label for="plsql_member">Plsql Member</label>
                    <select name="plsql_member" id="plsql_member">
                      <option value="loop">Loop</option>
                      <option value="decision">Decision</option>
                      <option value="crud">Crud</option>
                    </select>
                  <label for="machine_language">Machine Language</label><input type="text" name="machine_language" id="machine_language" placeholder="machine language" value="'||x.machine_language||'" />
                  <label for="description">Description</label><textarea name="description" id="description" placeholder="description">'||x.description||'</textarea>
                  <label for="human_language">Human Language</label><textarea name="human_language" id="human_language" placeholder="human language">'||x.human_language||'</textarea>
                  <label for="example">Example</label><textarea name="example" id="example" placeholder="example">'||x.example||'</textarea>
                  <label for="status">Status</label>
                    <input type="radio" name="status" id="status" />Hafal
                    <input type="radio" name="status" id="status" />Paham
                  <label for="author">Author</label><input type="text" name="author" id="author" placeholder="author name" value="'||x.author||'" />
                  <input type="submit" name="action" id="action" value="update" />
      ');
    end loop;
  else
    htp.p(' 
            <fieldset>
              <legend>Form Insert Materi Pembelajaran</legend>
                <label for="plsql_member">Plsql Member</label>
                  <select name="plsql_member" id="plsql_member">
                    <option value="loop">Loop</option>
                    <option value="decision">Decision</option>
                    <option value="crud">Crud</option>
                  </select>
                <label for="machine_language">Machine Language</label><input type="text" name="machine_language" id="machine_language" placeholder="machine language" />
                <label for="description">Description</label><textarea name="description" id="description" placeholder="description"></textarea>
                <label for="human_language">Human Language</label><textarea name="human_language" id="human_language" placeholder="human language"></textarea>
                <label for="example">Example</label><textarea name="example" id="example" placeholder="example"></textarea>
                <label for="status">Status</label>
                  <input type="radio" name="status" id="status" />Hafal
                  <input type="radio" name="status" id="status" />Paham
                <label for="author">Author</label><input type="text" name="author" id="author" placeholder="author name" />
                <input type="submit" name="action" id="action" value="insert" />
    ');
  end if;
  
  htp.p('
                <input type="button" name="action" id="action" value="cancel" onClick="window.location=''contoh''" />
            </fieldset>
          <table>
            <tr>
              <th>No</th>
              <th>PLSQL Member</th>
              <th>Machine Language</th>
              <th>Description</th>
              <th>Human Language</th>
              <th>Example</th>
              <th>Status</th>
              <th>Author</th>
              <th>Action</th>
            </tr>
  ');
  
  for x in (select * from table_pembelajaran)
  loop
    num := num+1;
    htp.p('
            <tr>
              <td>'||num||'</td>
              <td>'||x.plsql_member||'</td>
              <td>'||x.machine_language||'</td>
              <td>'||x.description||'</td>
              <td><pre>'||x.human_language||'</pre></td>
              <td>'||x.example||'</td>
              <td>'||x.status||'</td>
              <td>'||x.author||'</td>
              <td><input type="submit" name="action" id="action" value="edit?id='||x.id||'" />
              <input type="submit" name="action" id="action" value="delete?id='||x.id||'" /></td>
            </tr>
    ');
  end loop;
  
  htp.p('
          </table>
        </form> 
        <label>Pembimbing : </label><p>pAnji idOLakU</p><br />
        <label>Tembusan : </label><p>sEnA</p>
      </body>
    </html>
  ');
END CONTOH;