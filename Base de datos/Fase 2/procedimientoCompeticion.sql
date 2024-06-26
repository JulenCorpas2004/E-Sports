DROP PROCEDURE OBTENER_INFO_COMPETICION;

CREATE OR REPLACE PROCEDURE OBTENER_INFO_COMPETICION
(c_obtenerInfoCompeticion OUT SYS_REFCURSOR) AS
BEGIN
    OPEN c_obtenerInfoCompeticion FOR
        SELECT
            C.NOMBRE_COM,
            J.NOMBRE,
            EF.HORA_ENFRENTAMIENTO AS HORA,
            E1.NOM_EQUIPO AS EQUIPO_1,
            COUNT(DISTINCT J1.ID_JUGADOR) AS CANTIDAD_JUGADORES_EQUIPO_1,
            COUNT(DISTINCT S1.ID_STAFF) AS CANTIDAD_STAFF_EQUIPO_1,
            E2.NOM_EQUIPO AS EQUIPO_2,
            COUNT(DISTINCT J2.ID_JUGADOR) AS CANTIDAD_JUGADORES_EQUIPO_2,
            COUNT(DISTINCT S2.ID_STAFF) AS CANTIDAD_STAFF_EQUIPO_2
        FROM 
            ENFRENTAMIENTOS EF
        INNER JOIN EQUIPOS E1 ON EF.ID_EQUIPO1 = E1.ID_EQUIPO
        INNER JOIN EQUIPOS E2 ON EF.ID_EQUIPO2 = E2.ID_EQUIPO
        INNER JOIN COMPETICIONES C ON C.ID_JUEGO = C.ID_JUEGO
        INNER JOIN JUEGOS J ON C.ID_JUEGO = J.ID_JUEGO
        LEFT JOIN JUGADORES J1 ON EF.ID_EQUIPO1 = J1.ID_EQUIPO
        LEFT JOIN STAFFS S1 ON EF.ID_EQUIPO1 = S1.ID_EQUIPO
        LEFT JOIN JUGADORES J2 ON EF.ID_EQUIPO2 = J2.ID_EQUIPO
        LEFT JOIN STAFFS S2 ON EF.ID_EQUIPO2 = S2.ID_EQUIPO 
        GROUP BY
            C.NOMBRE_COM,
            J.NOMBRE,
            EF.HORA_ENFRENTAMIENTO,
            E1.NOM_EQUIPO,
            E2.NOM_EQUIPO;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro informacion especificada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al recuperar informacion.');
END;
