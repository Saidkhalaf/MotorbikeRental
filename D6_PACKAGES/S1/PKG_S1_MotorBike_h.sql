CREATE OR REPLACE PACKAGE PKG_S1_MOTORBIKES AS

    PROCEDURE BEWIJS_M4_S1;
    PROCEDURE EMPTY_TABLES_S1;


    FUNCTION lookup_MotorBike(p_registrationNr IN MotorBike.registrationNr%TYPE)
         RETURN MotorBike.chassisNr%TYPE;

    PROCEDURE Bewijs_Milestone_M5_S1(
        p_cus_count in number default 1,
        p_motB_count in number default 1,
        p_shop_count in number default 1,
        p_rental_count in number default 1);

    PROCEDURE generateRandomMotorBike(p_count in number default 1);

    PROCEDURE generatedRandomMotorBike_bulk(p_count IN NUMBER DEFAULT 1);


    PROCEDURE Bewijs_Milestone_M7_S1(
        p_cus_count in number default 1,
        p_motB_count in number default 1,
        p_shop_count in number default 1,
        p_rental_count in number default 1);

End PKG_S1_MOTORBIKES;


