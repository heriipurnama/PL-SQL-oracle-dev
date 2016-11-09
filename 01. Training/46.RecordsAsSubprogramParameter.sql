DEClARE
  type books is record
    (
      title varchar2(50);
      author varchar2(50);
      subject varchar2(50);
      book_id number
    );

  book1 books;
  book2 books;

  PROCEDURE printbook (book books) IS
  BEGIN
    dbms_output.put_line('Book title :' || book.title);
    dbms_output.put_line('Book author :' || book.author);
    dbms_output.put_line('Book subject :' || book.subject);
    dbms_output.put_line('Book book_id :' || book.book_id);
  END;
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

      --use PROCEDURE
      printbook(book1);
      printbook(book2);
    END;
    /
