-- A script that lists the bands with 'Glam rock' as
--  their main style, ranked by their longevity. metal-bands
--  table is defined in 2-metal_bands.sql
SELECT `band_name`, (IFNULL(`split`, 2022) - `formed`) AS `lifespan`
    FROM `metal_bands`
    WHERE `style` LIKE '%Glam rock%'
    ORDER BY `lifespan` DESC;
