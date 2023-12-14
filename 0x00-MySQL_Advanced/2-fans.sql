-- A script that lists the countries that bands originate
--  ordering them by the number of non-unique fans. metal-bands
--  table is defined in 2-metal_bands.sql
SELECT `origin`, SUM(`fans`) AS `nb_fans`
    FROM `metal_bands`
    GROUP BY `origin`
    ORDER BY `nb_fans` DESC;
