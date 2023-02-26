CREATE TABLE CC_GOAL (
    G_ID                    INTEGER NOT NULL CONSTRAINT G_PK PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    G_WEIGHT                DOUBLE,
    G_DEADLINE              DATE
);

CREATE TABLE CC_USER (
    U_ID                    INTEGER NOT NULL CONSTRAINT U_PK PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    U_EMAIL                 VARCHAR(50),
    U_USERNAME              VARCHAR(20),
    U_PASSWORD              VARCHAR(20),
    U_WEIGHT                DOUBLE,
    U_HEIGHT                DOUBLE,
    U_G_ID                  INTEGER CONSTRAINT G_FK REFERENCES CC_GOAL(G_ID)
);

CREATE TABLE CC_FOOD (
    F_ID                    INTEGER NOT NULL CONSTRAINT F_PK PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    F_NAME                  VARCHAR(20),
    F_CALORIES              DOUBLE
);

CREATE TABLE CC_CONSUMPTION (
    C_U_ID                  INTEGER NOT NULL CONSTRAINT U_FK REFERENCES CC_USER(U_ID),
    C_F_ID                  INTEGER NOT NULL CONSTRAINT F_FK REFERENCES CC_FOOD(F_ID),
    AMOUNT                  INTEGER,
    CONSTRAINT U_F_PK PRIMARY KEY (C_U_ID, C_F_ID)
);