-- CreateTable
CREATE TABLE `clientes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(20) NOT NULL,
    `correo` VARCHAR(150) NOT NULL,

    UNIQUE INDEX `clientes_correo_key`(`correo`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vehiculos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `placa` VARCHAR(20) NOT NULL,
    `marca` VARCHAR(50) NOT NULL,
    `modelo` VARCHAR(50) NOT NULL,
    `anio` INTEGER NOT NULL,
    `clienteId` INTEGER NOT NULL,

    UNIQUE INDEX `vehiculos_placa_key`(`placa`),
    INDEX `vehiculos_clienteId_idx`(`clienteId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ordenes_servicio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descripcion` TEXT NOT NULL,
    `fechaIngreso` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `estado` ENUM('abierta', 'en_proceso', 'entregada', 'cancelada') NOT NULL DEFAULT 'abierta',
    `vehiculoId` INTEGER NOT NULL,

    INDEX `ordenes_servicio_vehiculoId_idx`(`vehiculoId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refacciones` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `precio` DOUBLE NOT NULL,
    `ordenServicioId` INTEGER NOT NULL,

    INDEX `refacciones_ordenServicioId_idx`(`ordenServicioId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `vehiculos` ADD CONSTRAINT `vehiculos_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `clientes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ordenes_servicio` ADD CONSTRAINT `ordenes_servicio_vehiculoId_fkey` FOREIGN KEY (`vehiculoId`) REFERENCES `vehiculos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `refacciones` ADD CONSTRAINT `refacciones_ordenServicioId_fkey` FOREIGN KEY (`ordenServicioId`) REFERENCES `ordenes_servicio`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
