CREATE TABLE Score (Id int IDENTITY NOT NULL, Place int NOT NULL, Points int NOT NULL, ScoreSystemId int NOT NULL, PRIMARY KEY (Id));
CREATE TABLE ScoreSystem (Id int IDENTITY NOT NULL, Name varchar(255) NOT NULL UNIQUE, FastestLapPoints int DEFAULT 0 NOT NULL, PRIMARY KEY (Id));
CREATE TABLE Season (Id int IDENTITY NOT NULL, Year int NOT NULL, ScoreSystemId int NOT NULL, PRIMARY KEY (Id));
CREATE TABLE Discipline (Id int IDENTITY NOT NULL, Name varchar(100) NOT NULL UNIQUE, PRIMARY KEY (Id), CONSTRAINT CK_RS_Discipline_NameNotEmpty CHECK (Name <> ''));
CREATE TABLE Team (Id int IDENTITY NOT NULL, Name varchar(100) NOT NULL, Country varchar(100) NOT NULL, BaseTeamId int NULL, PRIMARY KEY (Id));
CREATE TABLE Race (Id int IDENTITY NOT NULL, Name varchar(100) NOT NULL, [Date] date NULL, SeasonId int NOT NULL, CircuitId int NOT NULL, PRIMARY KEY (Id));
CREATE TABLE Circuit (Id int IDENTITY NOT NULL, Name varchar(100) NOT NULL, City varchar(100) NOT NULL, Country varchar(100) NOT NULL, PRIMARY KEY (Id));
CREATE TABLE Result (RaceId int NOT NULL, DriverId int NOT NULL, Place int NOT NULL, HasFastestLap bit DEFAULT '0' NOT NULL, Status int DEFAULT 0 NOT NULL, PRIMARY KEY (RaceId, DriverId));
CREATE TABLE Driver (Id int IDENTITY NOT NULL, Name varchar(100) NOT NULL, BirthDate date NULL, Country varchar(100) NOT NULL, PRIMARY KEY (Id));
CREATE TABLE Driver_Team_season (TeamId int NOT NULL, DriverId int NOT NULL, SeasonId int NOT NULL, PRIMARY KEY (TeamId, DriverId, SeasonId));
CREATE TABLE Season_Team (SeasonId int NOT NULL, TeamId int NOT NULL, PRIMARY KEY (SeasonId, TeamId));
CREATE TABLE Discipline_Season (DisciplineId int NOT NULL, SeasonId int NOT NULL, PRIMARY KEY (DisciplineId, SeasonId));
ALTER TABLE Driver_Team_season ADD CONSTRAINT FKDriver_Tea866716 FOREIGN KEY (TeamId) REFERENCES Team (Id);
ALTER TABLE Driver_Team_season ADD CONSTRAINT FKDriver_Tea902940 FOREIGN KEY (DriverId) REFERENCES Driver (Id);
ALTER TABLE Result ADD CONSTRAINT FKResult203429 FOREIGN KEY (RaceId) REFERENCES Race (Id);
ALTER TABLE Result ADD CONSTRAINT FKResult868869 FOREIGN KEY (DriverId) REFERENCES Driver (Id);
ALTER TABLE Driver_Team_season ADD CONSTRAINT FKDriver_Tea485130 FOREIGN KEY (SeasonId) REFERENCES Season (Id);
ALTER TABLE Score ADD CONSTRAINT FKScore893897 FOREIGN KEY (ScoreSystemId) REFERENCES ScoreSystem (Id);
ALTER TABLE Season ADD CONSTRAINT FKSeason288211 FOREIGN KEY (ScoreSystemId) REFERENCES ScoreSystem (Id);
ALTER TABLE Race ADD CONSTRAINT FKRace351860 FOREIGN KEY (SeasonId) REFERENCES Season (Id);
ALTER TABLE Race ADD CONSTRAINT FKRace65468 FOREIGN KEY (CircuitId) REFERENCES Circuit (Id);
ALTER TABLE Season_Team ADD CONSTRAINT FKSeason_Tea486215 FOREIGN KEY (SeasonId) REFERENCES Season (Id);
ALTER TABLE Season_Team ADD CONSTRAINT FKSeason_Tea838062 FOREIGN KEY (TeamId) REFERENCES Team (Id);
ALTER TABLE Team ADD CONSTRAINT FKTeam200905 FOREIGN KEY (BaseTeamId) REFERENCES Team (Id);
ALTER TABLE Discipline_Season ADD CONSTRAINT FKDiscipline773057 FOREIGN KEY (DisciplineId) REFERENCES Discipline (Id);
ALTER TABLE Discipline_Season ADD CONSTRAINT FKDiscipline314335 FOREIGN KEY (SeasonId) REFERENCES Season (Id);