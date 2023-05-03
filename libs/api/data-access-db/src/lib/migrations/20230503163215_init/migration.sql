/*
  Warnings:

  - You are about to drop the column `imagePath` on the `HomeBlock` table. All the data in the column will be lost.
  - You are about to drop the column `rgbBackgroundId` on the `HomeBlock` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `HomeBlock` table. All the data in the column will be lost.
  - You are about to drop the `RgbBackground` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[imageId]` on the table `HomeBlock` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "HomeBlock" DROP CONSTRAINT "HomeBlock_rgbBackgroundId_fkey";

-- DropIndex
DROP INDEX "HomeBlock_rgbBackgroundId_key";

-- AlterTable
ALTER TABLE "HomeBlock" DROP COLUMN "imagePath",
DROP COLUMN "rgbBackgroundId",
DROP COLUMN "title",
ADD COLUMN     "imageId" TEXT;

-- DropTable
DROP TABLE "RgbBackground";

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "discountPrice" INTEGER,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "imagePath" TEXT NOT NULL,
    "rgbBackgroundId" TEXT NOT NULL,
    "productId" TEXT,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RgbColor" (
    "id" TEXT NOT NULL,
    "r" INTEGER NOT NULL,
    "g" INTEGER NOT NULL,
    "b" INTEGER NOT NULL,
    "a" DOUBLE PRECISION,
    "productId" TEXT,

    CONSTRAINT "RgbColor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Product_name_key" ON "Product"("name");

-- CreateIndex
CREATE UNIQUE INDEX "HomeBlock_imageId_key" ON "HomeBlock"("imageId");

-- AddForeignKey
ALTER TABLE "HomeBlock" ADD CONSTRAINT "HomeBlock_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_rgbBackgroundId_fkey" FOREIGN KEY ("rgbBackgroundId") REFERENCES "RgbColor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RgbColor" ADD CONSTRAINT "RgbColor_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;
