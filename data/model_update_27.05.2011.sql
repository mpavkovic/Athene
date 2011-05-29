CREATE TABLE  `osz_vrstavladanja` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`ematica_id` INT NOT NULL ,
`naziv` VARCHAR( 50 ) NOT NULL ,
UNIQUE (
`ematica_id`
)
) ENGINE = MYISAM ;

CREATE TABLE  `osz_boraviste` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`ematica_id` INT NOT NULL ,
`naziv` INT( 100 ) NOT NULL ,
UNIQUE (
`ematica_id`
)
) ENGINE = MYISAM ;

ALTER TABLE  `osz_nacionalnamanjina` ADD  `ematica_id` INT NOT NULL AFTER  `id` ,
ADD UNIQUE (
`ematica_id`
);

ALTER TABLE  `osz_predmet` ADD  `ematica_id` INT NOT NULL AFTER  `id` ,
ADD UNIQUE (
`ematica_id`
);


