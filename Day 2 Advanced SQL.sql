CREATE TABLE TUTOR
(
TutorID NUMBER NOT NULL,
CertDate DATE NOT NULL,
Status VARCHAR2(8) NOT NULL,
CONSTRAINT TutorID_PK PRIMARY KEY (TutorID)
);

INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (100,1/05/2015,'Active');
INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (101,1/05/2015,'Temp Stop');
INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (102,1/05/2015,'Dropped');
INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (103,5/22/2015,'Active');
INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (104,5/22/2015,'Active');
INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (105,5/22/2015,'Temp Stop');
INSERT INTO TUTOR (TutorID, CertDate, Status)
VALUES (106,5/22/2015,'Active');

CREATE TABLE MATCH_HISTORY
(
  MatchID NUMBER NOT NULL,
  TutorID NUMBER NOT NULL,
  StudentID NUMBER NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE,
  CONSTRAINT MatchID_PK PRIMARY KEY (MatchID)
);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (1,100,3000,1/10/2015,NULL);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (2,101,3001,1/15/2015,5/15/2015);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (3,102,3002,2/10/2015,3/01/2015);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (4,106,3003,5/28/2015,NULL);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (5,103,3004,6/01/2015,6/15/2015);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (6,104,3005,6/01/2015,6/28/2015);
 INSERT INTO MATCH_HISTORY (MatchID, TutorID, StudentID, StartDate, EndDate)
 VALUES (7,104,3006,6/01/2015,NULL);

CREATE TABLE STUDENT
(
  StudentID NUMBER NOT NULL,
  Read DECIMAL NOT NULL
);

INSERT INTO STUDENT (StudentID, Read)
VALUES (3000,2.3);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3001,5.6);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3002,1.3);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3003,3.3);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3004,2.7);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3005,4.8);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3006,7.8);
INSERT INTO STUDENT (StudentID, Read)
VALUES (3007,1.5);

CREATE TABLE TUTOR_REPORT
(
  MatchID NUMBER NOT NULL,
  Month DATE NOT NULL,
  Hours NUMBER NOT NULL,
  Lesson NUMBER NOT NULL
);

INSERT INTO TUTOR_REPORT (MatchID, Month, Hours, Lesson)
VALUES (1,6/15,8,4);
INSERT INTO TUTOR_REPORT (MatchID, Month, Hours, Lesson)
VALUES (4,6/15,8,6);
INSERT INTO TUTOR_REPORT (MatchID, Month, Hours, Lesson)
VALUES (5,6/15,4,4);
INSERT INTO TUTOR_REPORT (MatchID, Month, Hours, Lesson)
VALUES (4,7/15,10,5);
INSERT INTO TUTOR_REPORT (MatchID, Month, Hours, Lesson)
VALUES (1,7/15,4,2);

ALTER TABLE STUDENT
ADD MATH_SCORE NUMBER;

ALTER TABLE TUTOR
ADD SUBJECT VARCHAR2(7)
CHECK (SUBJECT IN('Reading','Math','ESL'));

SELECT MATCH_History.MatchID FROM MATCH_HISTORY, TUTOR_REPORT WHERE TUTOR_REPORT.MatchID = MATCH_History.MatchID AND TUTOR_REPORT.Month <> 6/15;

