DEClARE
  type books is record
    (title varchar2(50),
      author varchar2(50),
      subject varchar2(100),
      book_id number
  );

  book1 books;
  book2 books;
  BEGIN
    --book 1 spesifikasi
    book1.title := 'C Programing';
    book1.author := 'heriipurnama';
    book1.subject := 'C Programing Tutorial';
    book1.book_id := 'jta8z79h';

    --book 2 spesifikasi
    book2.title := 'C Programing';
    book2.author := 'heriipurnama';
    book2.subject := 'C Programing Tutorial';
    book2.book_id := 'jta8z79h';

    --print book 1 records
    dbms_output.put_line ('Book 1 title : '|| book1.title);
        dbms_output.put_line ('Book 1 author : '|| book1.author);
            dbms_output.put_line ('Book 1 subject : '|| book1.subject);
                dbms_output.put_line ('Book 1 book_id : '|| book1.book_id);

                --print book 1 records
                dbms_output.put_line ('Book 2 title : '|| book2.title);
                    dbms_output.put_line ('Book 2 author : '|| book2.author);
                        dbms_output.put_line ('Book 2 subject : '|| book2.subject);
                            dbms_output.put_line ('Book 2 book_id : '|| book2.book_id);
  END;
  /
