Q1
mysql> CREATE TABLE departments (
    → department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    → name VARCHAR(20) NOT NULL,
    → created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    → updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    → );

Q2
mysql> ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

Q3
追加する部署一覧（departments）
mysql> INSERT INTO departments (name)
    → VALUES
    → ('営業'),
    → ('開発'),
    → ('経理'),
    → ('人事'),
    → ('情報システム');

追加する人の条件（people）
mysql> INSERT INTO people (name,email,department_id,age,gender)
    → VALUES
    → ('竹内','takeuchi@gizumo.jp',1,26,1),
    → ('佐藤','sato@gizumo.jp',1,18,2),
    → ('高橋','takahashi@gizumo.jp',1,22,1),
    → ('伊藤','ito@gizumo.jp',2,31,2),
    → ('渡辺','watanabe@gizumo.jp',2,47,1),
    → ('山本','yamamoto@gizumo.jp',2,51,2),
    → ('中村','nakamura@gizumo.jp',2,69,1),
    → ('小林','kobayashi@gizumo.jp',3,75,2),
    → ('加藤','kato@gizumo.jp',4,80,1),
    → ('吉田','yoshida@gizumo.jp',5,97,2);

追加する日報の条件（reports）
mysql> INSERT INTO reports (person_id,content)
    → VALUES
    → (1,'念には念を入れる'),
    → (2,'三度目の正直'),
    → (3,'全力投球'),
    → (4,'継続は力なり'),
    → (6,'笑う門には福来る'),
    → (7,'人事を尽くして天命を待つ'),
    → (8,'失敗は成功の基'),
    → (9,'雲の上はいつも晴れ'),
    → (10,'後悔先に立たず'),
    → (11,'天高く馬肥ゆる');

Q4
mysql> UPDATE people SET department_id = 1 WHERE person_id =1;
       UPDATE people SET department_id = 2 WHERE person_id =2;
       UPDATE people SET department_id = 3 WHERE person_id =3;
       UPDATE people SET department_id = 4 WHERE person_id =4;
       UPDATE people SET department_id = 5 WHERE person_id =6;

Q5
mysql> SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
SELECT name, email, age FROM people WHERE department_id = 1 ORDER BY created_at;
（peopleテーブルの中のname、email、ageカラムにdepartment_idが1と等しいコンテンツの作成日時を降順に並べる）

Q7
mysql> SELECT name FROM people WHERE (age BETWEEN 20 AND 29 AND gender = 2) OR (age BETWEEN 40 AND 49 AND gender = 1);

Q8
mysql> SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9
mysql> SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 GROUP BY gender = 2;

Q10
mysql> SELECT p.name, d.department_id, r.report_id, content FROM people p JOIN departments d ON (p.department_id = d.department_id) JOIN reports r ON (p.person_id = r.person_id);

Q11
mysql> SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r ON (p.person_id = r.person_id) WHERE content IS NULL;