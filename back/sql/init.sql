DROP TABLE IF EXISTS members;

DROP TYPE IF EXISTS member_gender;

CREATE TYPE member_gender AS ENUM (
    'FEMALE',
    'MALE',
    'UNKNOWN'
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY, -- id
    "username" varchar(15) NOT NULL,    -- User Name
    "fullname" varchar(25),    -- Full Name
    "dob" date, -- DOB
    "gender" member_gender NOT NULL, -- Gender
    "createdAt" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP -- Timestamp when created
);

INSERT INTO members (
    "username",
    "fullname",
    "dob",
    "gender"
) VALUES (
    'kevin2020',   -- username
    'Kevin',    -- fullname
    '1981-12-16',     -- dob
    'MALE'     -- gender
), (
    'g45312',   -- username
    'Grant',    -- fullname
    '1973-09-23',     -- dob
    'MALE'     -- gender
), (
    'L01559H002',   -- username
    'Lisa',    -- fullname
    '1976-04-19',     -- dob
    'FEMALE'     -- gender
);