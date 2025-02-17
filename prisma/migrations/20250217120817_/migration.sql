-- CreateTable
CREATE TABLE `Request` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `a` INTEGER NOT NULL,
    `b` INTEGER NOT NULL,
    `answer` INTEGER NOT NULL,
    `type` ENUM('ADD', 'MUL') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
