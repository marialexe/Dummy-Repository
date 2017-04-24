# SQL Homework

The Dominion Cinema are having a Marvel Movie Marathon! They have asked you to help maintain their database of movies with times and attendees.

## To access the database:

First, create a database called 'marvel'
```
# terminal
createdb marvel
```

Next, run the provided SQL script to populate your database:
```
# terminal
psql -d marvel -f marvel.sql
```

Use the supplied data as the source of data to answer the questions.  Copy the SQL command you have used to get the answer, and paste it below the question, along with the result they gave.

## Questions

1. Return ALL the data in the 'movies' table.

SQL command:

      SELECT * FROM movies;

Result:

      id |                title                | year | show_time 
      ----+-------------------------------------+------+-----------
        1 | Iron Man                            | 2008 | 14:05
        2 | The Incredible Hulk                 | 2008 | 15:20
        3 | Iron Man 2                          | 2010 | 19:20
        4 | Thor                                | 2011 | 22:40
        5 | Captain America: The First Avenger  | 2011 | 21:55
        6 | Avengers Assemble                   | 2012 | 17:25
        7 | Iron Man 3                          | 2013 | 15:55
        8 | Thor: The Dark World                | 2013 | 18:55
        9 | Batman Begins                       | 2005 | 22:25
       10 | Captain America: The Winter Soldier | 2014 | 15:25
       11 | Guardians of the Galaxy             | 2014 | 21:45
       12 | Avengers: Age of Ultron             | 2015 | 18:30
       13 | Ant-Man                             | 2015 | 21:10
       14 | Captain America: Civil War          | 2016 | 22:45
       15 | Doctor Strange                      | 2016 | 12:40
      (15 rows)

2. Return ONLY the name column from the 'people' table

SQL command:

      SELECT name FROM people;

Result:

           name         
      ---------------------
       Alasdair Gerrie
       Alex Berry
       Charlie Wood
       Christopher Woodall
       Daniel Garrido
       Eoghan Crowley
       Craig Morton
       Simon
       Simon
       Gillian Liddle
       Irma Rasikeviciute
       Jnny Watson
       Lewis Burns
       Louise Camlin
       Marilena Alexe
       Matt Rose
       Mike Casey
       Mungo Dewar
       Nick Bulbeck
       Paul Jablonski
       Richard Edwards
      (21 rows)

3.Oops! Someone at CodeClan spelled Johnny's name wrong! Change it to reflect the proper spelling (change 'Jnny Watson' to 'Johnny Watson').

SQL command:

      UPDATE people SET name='Johnny Watson' WHERE name='Jnny Watson';
      SELECT name FROM people;

Result:

      UPDATE 1
              name         
      ---------------------
       Alasdair Gerrie
       Alex Berry
       Charlie Wood
       Christopher Woodall
       Daniel Garrido
       Eoghan Crowley
       Craig Morton
       Simon
       Simon
       Gillian Liddle
       Irma Rasikeviciute
       Lewis Burns
       Louise Camlin
       Marilena Alexe
       Matt Rose
       Mike Casey
       Mungo Dewar
       Nick Bulbeck
       Paul Jablonski
       Richard Edwards
       Johnny Watson
      (21 rows)



4. Return ONLY your name from the 'people' table.

SQL command:

      SELECT name FROM people WHERE name='Marilena Alexe';

Result:

           name      
      ----------------
       Marilena Alexe
      (1 row)

5. The cinema is showing 'Batman Begins', but Batman is DC, not Marvel! Delete the entry from the 'movies' table.

SQL command:

      DELETE FROM movies WHERE title='Batman Begins';
      SELECT * FROM movies;

OR:

      DELETE FROM movies WHERE id=9;
      SELECT * FROM movies;

Result:

      DELETE 1
       id |                title                | year | show_time 
      ----+-------------------------------------+------+-----------
        1 | Iron Man                            | 2008 | 14:05
        2 | The Incredible Hulk                 | 2008 | 15:20
        3 | Iron Man 2                          | 2010 | 19:20
        4 | Thor                                | 2011 | 22:40
        5 | Captain America: The First Avenger  | 2011 | 21:55
        6 | Avengers Assemble                   | 2012 | 17:25
        7 | Iron Man 3                          | 2013 | 15:55
        8 | Thor: The Dark World                | 2013 | 18:55
       10 | Captain America: The Winter Soldier | 2014 | 15:25
       11 | Guardians of the Galaxy             | 2014 | 21:45
       12 | Avengers: Age of Ultron             | 2015 | 18:30
       13 | Ant-Man                             | 2015 | 21:10
       14 | Captain America: Civil War          | 2016 | 22:45
       15 | Doctor Strange                      | 2016 | 12:40
      (14 rows)

6. Create a new entry in the 'people' table with the name of one of the instructors.

SQL command:

      INSERT INTO people (name) VALUES ('Matthew Healy');
      SELECT * FROM people;

Result:

      INSERT 0 1
       id |        name         
      ----+---------------------
        1 | Alasdair Gerrie
        2 | Alex Berry
        3 | Charlie Wood
        4 | Christopher Woodall
        5 | Daniel Garrido
        6 | Eoghan Crowley
        7 | Craig Morton
        8 | Simon
        9 | Simon
       10 | Gillian Liddle
       11 | Irma Rasikeviciute
       13 | Lewis Burns
       14 | Louise Camlin
       15 | Marilena Alexe
       16 | Matt Rose
       17 | Mike Casey
       18 | Mungo Dewar
       19 | Nick Bulbeck
       20 | Paul Jablonski
       21 | Richard Edwards
       12 | Johnny Watson
       22 | Matthew Healy
      (22 rows)

7. Craig Morton, has decided to hijack our movie evening, Remove him from the table of people.

SQL command:

      DELETE FROM people WHERE name='Craig Morton';
      SELECT * FROM people;

Result:

      DELETE 1
       id |        name         
      ----+---------------------
        1 | Alasdair Gerrie
        2 | Alex Berry
        3 | Charlie Wood
        4 | Christopher Woodall
        5 | Daniel Garrido
        6 | Eoghan Crowley
        8 | Simon
        9 | Simon
       10 | Gillian Liddle
       11 | Irma Rasikeviciute
       13 | Lewis Burns
       14 | Louise Camlin
       15 | Marilena Alexe
       16 | Matt Rose
       17 | Mike Casey
       18 | Mungo Dewar
       19 | Nick Bulbeck
       20 | Paul Jablonski
       21 | Richard Edwards
       12 | Johnny Watson
       22 | Matthew Healy
      (21 rows)

8. Somehow the list of people includes two people named 'Simon'. Change these entries to the proper names ('Jack Jarvis' and 'Victor McDade')

SQL command:

      UPDATE people SET name='Jack Jarvis' WHERE name='Simon' AND id=8;
      UPDATE people SET name='Victor McDade' WHERE name='Simon' AND id=9;
      SELECT * FROM people;

Result:

      UPDATE 1
      UPDATE 1
       id |        name         
      ----+---------------------
        1 | Alasdair Gerrie
        2 | Alex Berry
        3 | Charlie Wood
        4 | Christopher Woodall
        5 | Daniel Garrido
        6 | Eoghan Crowley
       10 | Gillian Liddle
       11 | Irma Rasikeviciute
       13 | Lewis Burns
       14 | Louise Camlin
       15 | Marilena Alexe
       16 | Matt Rose
       17 | Mike Casey
       18 | Mungo Dewar
       19 | Nick Bulbeck
       20 | Paul Jablonski
       21 | Richard Edwards
       12 | Johnny Watson
       22 | Matthew Healy
        8 | Jack Jarvis
        9 | Victor McDade
      (21 rows)


9. The cinema has just heard that they will be holding an exclusive midnight showing of 'Guardians of the Galaxy 2'!! Create a new entry in the 'movies' table to reflect this.

SQL command:

      INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2',2017,'00:00');
      SELECT * FROM movies;

Result:

      INSERT 0 1
       id |                title                | year | show_time 
      ----+-------------------------------------+------+-----------
        1 | Iron Man                            | 2008 | 14:05
        2 | The Incredible Hulk                 | 2008 | 15:20
        3 | Iron Man 2                          | 2010 | 19:20
        4 | Thor                                | 2011 | 22:40
        5 | Captain America: The First Avenger  | 2011 | 21:55
        6 | Avengers Assemble                   | 2012 | 17:25
        7 | Iron Man 3                          | 2013 | 15:55
        8 | Thor: The Dark World                | 2013 | 18:55
       10 | Captain America: The Winter Soldier | 2014 | 15:25
       11 | Guardians of the Galaxy             | 2014 | 21:45
       12 | Avengers: Age of Ultron             | 2015 | 18:30
       13 | Ant-Man                             | 2015 | 21:10
       14 | Captain America: Civil War          | 2016 | 22:45
       15 | Doctor Strange                      | 2016 | 12:40
       16 | Guardians of the Galaxy 2           | 2017 | 00:00
      (15 rows)

10. The cinema would also like to make the Guardian movies a back to back feature. Update the 'Guardians of the Galaxy' show time from 12:10 to 21:30

     ... The show time for 'Guardians of the Galaxy' is not 12:30, but 21:45, so another line of SQL code was added as a result...

SQL command: 

      UPDATE movies SET show_time='21:30' WHERE title='Guardians of the Galaxy' AND show_time='12:10';
      UPDATE movies SET show_time='12:10' WHERE title='Guardians of the Galaxy' AND show_time='21:45';
      UPDATE movies SET show_time='21:30' WHERE title='Guardians of the Galaxy' AND show_time='12:10';
      SELECT * FROM movies;

Result:

      UPDATE 0
      UPDATE 1
      UPDATE 1
       id |                title                | year | show_time 
      ----+-------------------------------------+------+-----------
        1 | Iron Man                            | 2008 | 14:05
        2 | The Incredible Hulk                 | 2008 | 15:20
        3 | Iron Man 2                          | 2010 | 19:20
        4 | Thor                                | 2011 | 22:40
        5 | Captain America: The First Avenger  | 2011 | 21:55
        6 | Avengers Assemble                   | 2012 | 17:25
        7 | Iron Man 3                          | 2013 | 15:55
        8 | Thor: The Dark World                | 2013 | 18:55
       10 | Captain America: The Winter Soldier | 2014 | 15:25
       12 | Avengers: Age of Ultron             | 2015 | 18:30
       13 | Ant-Man                             | 2015 | 21:10
       14 | Captain America: Civil War          | 2016 | 22:45
       15 | Doctor Strange                      | 2016 | 12:40
       16 | Guardians of the Galaxy 2           | 2017 | 00:00
       11 | Guardians of the Galaxy             | 2014 | 21:30
      (15 rows)

## Extension

1. Research how to delete multiple entries from your table in a single command.

    1. If you need to delete based on a list, you can use IN:

      DELETE FROM table_name WHERE id IN (value1, value2, ...);
      or
      DELETE FROM table_name WHERE id IN (SELECT id FROM other_table_name);

    2. If you need to delete based on the result of a query, you can also use IN. Notice that the subquery must return only one column.

      DELETE FROM table_name WHERE id IN (select aColumn from ...);
    

    3. If you need to delete based on a range of values, either use BETWEEN or inequalities:


      DELETE FROM table_name WHERE id BETWEEN bottom_value AND top_value;
      or
      DELETE FROM table_name WHERE id >= a_value AND id <= another_value;








