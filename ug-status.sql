ALTER TABLE `users` ADD COLUMN `status` LONGTEXT NULL;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `canRemove`) VALUES
    ('burger', 'Hamburger', 2, 0, 1),
    ('water', 'Water', 2, 0, 1)
;