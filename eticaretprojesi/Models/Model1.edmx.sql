
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/14/2023 23:08:34
-- Generated from EDMX file: C:\Users\sahin\OneDrive\Masaüstü\eticaretprojesi\eticaretprojesi\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [eticaretprojesi];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_musteri_Login]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[musteri] DROP CONSTRAINT [FK_musteri_Login];
GO
IF OBJECT_ID(N'[dbo].[FK_musteri_SepetId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[musteri] DROP CONSTRAINT [FK_musteri_SepetId];
GO
IF OBJECT_ID(N'[dbo].[FK_musteri_SiparisGecmisi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[musteri] DROP CONSTRAINT [FK_musteri_SiparisGecmisi];
GO
IF OBJECT_ID(N'[dbo].[FK_Ozellik_Kategoriler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ozellik] DROP CONSTRAINT [FK_Ozellik_Kategoriler];
GO
IF OBJECT_ID(N'[dbo].[FK_SepetId_Urunler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SepetId] DROP CONSTRAINT [FK_SepetId_Urunler];
GO
IF OBJECT_ID(N'[dbo].[FK_Siparis_musteri]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_Siparis_musteri];
GO
IF OBJECT_ID(N'[dbo].[FK_Siparis_OdemeYontemi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_Siparis_OdemeYontemi];
GO
IF OBJECT_ID(N'[dbo].[FK_Siparis_SiparisDetay]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_Siparis_SiparisDetay];
GO
IF OBJECT_ID(N'[dbo].[FK_Siparis_SiparisDurumu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Siparis] DROP CONSTRAINT [FK_Siparis_SiparisDurumu];
GO
IF OBJECT_ID(N'[dbo].[FK_SiparisDetay_KargoFirmasi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisDetay] DROP CONSTRAINT [FK_SiparisDetay_KargoFirmasi];
GO
IF OBJECT_ID(N'[dbo].[FK_SiparisDetay_OdemeYontemi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisDetay] DROP CONSTRAINT [FK_SiparisDetay_OdemeYontemi];
GO
IF OBJECT_ID(N'[dbo].[FK_SiparisDetay_Ozellik]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisDetay] DROP CONSTRAINT [FK_SiparisDetay_Ozellik];
GO
IF OBJECT_ID(N'[dbo].[FK_SiparisDetay_Urunler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisDetay] DROP CONSTRAINT [FK_SiparisDetay_Urunler];
GO
IF OBJECT_ID(N'[dbo].[FK_SiparisDetay_Varyant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisDetay] DROP CONSTRAINT [FK_SiparisDetay_Varyant];
GO
IF OBJECT_ID(N'[dbo].[FK_Urunler_Kategoriler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [FK_Urunler_Kategoriler];
GO
IF OBJECT_ID(N'[dbo].[FK_Urunler_TeslimatBilgileri]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Urunler] DROP CONSTRAINT [FK_Urunler_TeslimatBilgileri];
GO
IF OBJECT_ID(N'[dbo].[FK_UrunVaryant_Ozellik]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UrunVaryant] DROP CONSTRAINT [FK_UrunVaryant_Ozellik];
GO
IF OBJECT_ID(N'[dbo].[FK_UrunVaryant_Urunler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UrunVaryant] DROP CONSTRAINT [FK_UrunVaryant_Urunler];
GO
IF OBJECT_ID(N'[dbo].[FK_UrunVaryant_Varyant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UrunVaryant] DROP CONSTRAINT [FK_UrunVaryant_Varyant];
GO
IF OBJECT_ID(N'[dbo].[FK_Varyant_Kategoriler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Varyant] DROP CONSTRAINT [FK_Varyant_Kategoriler];
GO
IF OBJECT_ID(N'[dbo].[FK_Yorumlar_musteri]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Yorumlar] DROP CONSTRAINT [FK_Yorumlar_musteri];
GO
IF OBJECT_ID(N'[dbo].[FK_Yorumlar_Urunler]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Yorumlar] DROP CONSTRAINT [FK_Yorumlar_Urunler];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Gizlilikİlkesi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Gizlilikİlkesi];
GO
IF OBJECT_ID(N'[dbo].[Hakkimizda]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hakkimizda];
GO
IF OBJECT_ID(N'[dbo].[İadeKosullari]', 'U') IS NOT NULL
    DROP TABLE [dbo].[İadeKosullari];
GO
IF OBJECT_ID(N'[dbo].[KargoFirmasi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KargoFirmasi];
GO
IF OBJECT_ID(N'[dbo].[Kategoriler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Kategoriler];
GO
IF OBJECT_ID(N'[dbo].[Login]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Login];
GO
IF OBJECT_ID(N'[dbo].[MailAbone]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MailAbone];
GO
IF OBJECT_ID(N'[dbo].[MailAyarlari]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MailAyarlari];
GO
IF OBJECT_ID(N'[dbo].[musteri]', 'U') IS NOT NULL
    DROP TABLE [dbo].[musteri];
GO
IF OBJECT_ID(N'[dbo].[OdemeYontemi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OdemeYontemi];
GO
IF OBJECT_ID(N'[dbo].[Ozellik]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ozellik];
GO
IF OBJECT_ID(N'[dbo].[Seo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Seo];
GO
IF OBJECT_ID(N'[dbo].[SepetId]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SepetId];
GO
IF OBJECT_ID(N'[dbo].[Siparis]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Siparis];
GO
IF OBJECT_ID(N'[dbo].[SiparisDetay]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SiparisDetay];
GO
IF OBJECT_ID(N'[dbo].[SiparisDurumu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SiparisDurumu];
GO
IF OBJECT_ID(N'[dbo].[SiparisGecmisi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SiparisGecmisi];
GO
IF OBJECT_ID(N'[dbo].[Siteayarlari]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Siteayarlari];
GO
IF OBJECT_ID(N'[dbo].[SosyalMediya]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SosyalMediya];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TeslimatBilgileri]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TeslimatBilgileri];
GO
IF OBJECT_ID(N'[dbo].[Urunler]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Urunler];
GO
IF OBJECT_ID(N'[dbo].[UrunVaryant]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UrunVaryant];
GO
IF OBJECT_ID(N'[dbo].[Uyesözleşmesi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Uyesözleşmesi];
GO
IF OBJECT_ID(N'[dbo].[Varyant]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Varyant];
GO
IF OBJECT_ID(N'[dbo].[Yorumlar]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Yorumlar];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Gizlilikİlkesi'
CREATE TABLE [dbo].[Gizlilikİlkesi] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Baslik] nvarchar(50)  NULL,
    [Anahtar_Kelime] nvarchar(50)  NULL,
    [Icerik] nvarchar(max)  NULL,
    [Title] nvarchar(20)  NULL
);
GO

-- Creating table 'Hakkimizda'
CREATE TABLE [dbo].[Hakkimizda] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Baslik] nvarchar(50)  NULL,
    [Icerik] nvarchar(max)  NULL,
    [Anahtar_kelime] nvarchar(50)  NULL,
    [Title] nvarchar(20)  NULL
);
GO

-- Creating table 'İadeKosullari'
CREATE TABLE [dbo].[İadeKosullari] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Baslik] nvarchar(50)  NULL,
    [Icerik] nvarchar(max)  NULL,
    [Ahatar_kelime] nvarchar(50)  NULL,
    [Title] nvarchar(20)  NULL
);
GO

-- Creating table 'KargoFirmasi'
CREATE TABLE [dbo].[KargoFirmasi] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Sİrket] nvarchar(50)  NULL,
    [Adres] nvarchar(300)  NULL,
    [Telefon] nvarchar(16)  NULL,
    [Websitesi] nvarchar(50)  NULL,
    [Eposta] nvarchar(50)  NULL,
    [Vergino] nvarchar(30)  NULL
);
GO

-- Creating table 'Kategoriler'
CREATE TABLE [dbo].[Kategoriler] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nvarchar(50)  NULL,
    [UstKategoriId] int  NULL
);
GO

-- Creating table 'Login'
CREATE TABLE [dbo].[Login] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [KullaniciAdi] nvarchar(50)  NULL,
    [Sifre] nvarchar(50)  NULL,
    [AdminMi] bit  NULL
);
GO

-- Creating table 'MailAbone'
CREATE TABLE [dbo].[MailAbone] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MailAdresi] nvarchar(80)  NULL
);
GO

-- Creating table 'MailAyarlari'
CREATE TABLE [dbo].[MailAyarlari] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Gonderici_bilgisi] nvarchar(50)  NULL,
    [Smtp_server] nvarchar(50)  NULL,
    [Smtp_port] nchar(10)  NULL,
    [Mail_gonderici] nvarchar(50)  NULL,
    [Eposta] nvarchar(50)  NULL,
    [Eposta_Sifresi] nvarchar(50)  NULL
);
GO

-- Creating table 'Musteri'
CREATE TABLE [dbo].[Musteri] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [adi] nvarchar(50)  NULL,
    [Soyadi] nvarchar(50)  NULL,
    [Eposta] nvarchar(50)  NULL,
    [DogumTArihi] datetime  NULL,
    [Sifre] nvarchar(50)  NULL,
    [SepetId] int  NULL,
    [LoginId] int  NULL,
    [SiparisGecmisId] int  NULL,
    [TeslimatAdresi] nvarchar(500)  NULL,
    [FaturaAdresi] nvarchar(500)  NULL,
    [YorumId] int  NULL
);
GO

-- Creating table 'OdemeYontemi'
CREATE TABLE [dbo].[OdemeYontemi] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nvarchar(50)  NULL,
    [Aciklama] nvarchar(300)  NULL
);
GO

-- Creating table 'Ozellik'
CREATE TABLE [dbo].[Ozellik] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nchar(50)  NULL,
    [KategoriId] int  NULL
);
GO

-- Creating table 'Seo'
CREATE TABLE [dbo].[Seo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Baslik] nvarchar(50)  NULL,
    [Title] nvarchar(20)  NULL,
    [Harita] nvarchar(max)  NULL,
    [Anahtar_kelime] nvarchar(50)  NULL
);
GO

-- Creating table 'SepetId'
CREATE TABLE [dbo].[SepetId] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UrunId] int  NULL,
    [VaryantId] int  NULL,
    [Miktari] int  NULL,
    [Toplam] decimal(18,0)  NULL,
    [OzelikId] int  NULL
);
GO

-- Creating table 'Siparis'
CREATE TABLE [dbo].[Siparis] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SatisTarihi] datetime  NULL,
    [MusteriID] int  NULL,
    [SiparisDurumuId] int  NULL,
    [KargoTakip] nvarchar(50)  NULL,
    [OdemeYontemiId] int  NULL,
    [SepetDetayId] int  NULL
);
GO

-- Creating table 'SiparisDetay'
CREATE TABLE [dbo].[SiparisDetay] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UrunId] int  NULL,
    [VaryantId] int  NULL,
    [Fiyat] decimal(18,0)  NULL,
    [Miktar] int  NULL,
    [KargoId] int  NULL,
    [OdemeYontemId] int  NULL,
    [OzellikId] int  NULL
);
GO

-- Creating table 'SiparisDurumu'
CREATE TABLE [dbo].[SiparisDurumu] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nvarchar(50)  NULL,
    [Detay] nvarchar(300)  NULL
);
GO

-- Creating table 'SiparisGecmisi'
CREATE TABLE [dbo].[SiparisGecmisi] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nvarchar(50)  NULL,
    [Detay] nvarchar(3000)  NULL
);
GO

-- Creating table 'SiteAyarlari'
CREATE TABLE [dbo].[SiteAyarlari] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Telefon] nvarchar(50)  NULL,
    [Whatsapp] nvarchar(50)  NULL,
    [Adres] nvarchar(100)  NULL,
    [Eposta] nvarchar(50)  NULL
);
GO

-- Creating table 'SosyalMediya'
CREATE TABLE [dbo].[SosyalMediya] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Facebook] nvarchar(max)  NULL,
    [Instagram] nvarchar(max)  NULL,
    [Youtube] nvarchar(max)  NULL,
    [twitter] nvarchar(max)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TeslimatBilgileri'
CREATE TABLE [dbo].[TeslimatBilgileri] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nvarchar(50)  NULL,
    [Icerik] nvarchar(400)  NULL
);
GO

-- Creating table 'Urunler'
CREATE TABLE [dbo].[Urunler] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adi] nvarchar(50)  NULL,
    [fiyat] decimal(18,0)  NULL,
    [Resim] nvarchar(max)  NULL,
    [Aciklama] nvarchar(max)  NULL,
    [Stok_Kodu] nvarchar(50)  NULL,
    [Adet] int  NULL,
    [Ekleme_Tarih] datetime  NULL,
    [KategoriID] int  NULL,
    [TeslimatId] int  NULL
);
GO

-- Creating table 'UrunVaryant'
CREATE TABLE [dbo].[UrunVaryant] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UrunId] int  NULL,
    [VaryantId] int  NULL,
    [Miktar] int  NULL,
    [OzelliklerId] int  NULL
);
GO

-- Creating table 'Uyesözleşmesi'
CREATE TABLE [dbo].[Uyesözleşmesi] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Icerik] nvarchar(max)  NULL,
    [Baslik] nvarchar(50)  NULL,
    [Anahtar_Kelime] nvarchar(50)  NULL,
    [Title] nvarchar(20)  NULL
);
GO

-- Creating table 'Varyant'
CREATE TABLE [dbo].[Varyant] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tanim] nvarchar(50)  NULL,
    [KategoriId] int  NULL
);
GO

-- Creating table 'Yorumlar'
CREATE TABLE [dbo].[Yorumlar] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UrunId] int  NULL,
    [Yorum] nvarchar(max)  NULL,
    [Tarih] datetime  NULL,
    [MusteriId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Gizlilikİlkesi'
ALTER TABLE [dbo].[Gizlilikİlkesi]
ADD CONSTRAINT [PK_Gizlilikİlkesi]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Hakkimizda'
ALTER TABLE [dbo].[Hakkimizda]
ADD CONSTRAINT [PK_Hakkimizda]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'İadeKosullari'
ALTER TABLE [dbo].[İadeKosullari]
ADD CONSTRAINT [PK_İadeKosullari]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'KargoFirmasi'
ALTER TABLE [dbo].[KargoFirmasi]
ADD CONSTRAINT [PK_KargoFirmasi]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Kategoriler'
ALTER TABLE [dbo].[Kategoriler]
ADD CONSTRAINT [PK_Kategoriler]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Login'
ALTER TABLE [dbo].[Login]
ADD CONSTRAINT [PK_Login]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MailAbone'
ALTER TABLE [dbo].[MailAbone]
ADD CONSTRAINT [PK_MailAbone]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MailAyarlari'
ALTER TABLE [dbo].[MailAyarlari]
ADD CONSTRAINT [PK_MailAyarlari]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Musteri'
ALTER TABLE [dbo].[Musteri]
ADD CONSTRAINT [PK_Musteri]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OdemeYontemi'
ALTER TABLE [dbo].[OdemeYontemi]
ADD CONSTRAINT [PK_OdemeYontemi]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ozellik'
ALTER TABLE [dbo].[Ozellik]
ADD CONSTRAINT [PK_Ozellik]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Seo'
ALTER TABLE [dbo].[Seo]
ADD CONSTRAINT [PK_Seo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SepetId'
ALTER TABLE [dbo].[SepetId]
ADD CONSTRAINT [PK_SepetId]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [PK_Siparis]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SiparisDetay'
ALTER TABLE [dbo].[SiparisDetay]
ADD CONSTRAINT [PK_SiparisDetay]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SiparisDurumu'
ALTER TABLE [dbo].[SiparisDurumu]
ADD CONSTRAINT [PK_SiparisDurumu]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SiparisGecmisi'
ALTER TABLE [dbo].[SiparisGecmisi]
ADD CONSTRAINT [PK_SiparisGecmisi]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SiteAyarlari'
ALTER TABLE [dbo].[SiteAyarlari]
ADD CONSTRAINT [PK_SiteAyarlari]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SosyalMediya'
ALTER TABLE [dbo].[SosyalMediya]
ADD CONSTRAINT [PK_SosyalMediya]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Id] in table 'TeslimatBilgileri'
ALTER TABLE [dbo].[TeslimatBilgileri]
ADD CONSTRAINT [PK_TeslimatBilgileri]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Urunler'
ALTER TABLE [dbo].[Urunler]
ADD CONSTRAINT [PK_Urunler]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UrunVaryant'
ALTER TABLE [dbo].[UrunVaryant]
ADD CONSTRAINT [PK_UrunVaryant]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Uyesözleşmesi'
ALTER TABLE [dbo].[Uyesözleşmesi]
ADD CONSTRAINT [PK_Uyesözleşmesi]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Varyant'
ALTER TABLE [dbo].[Varyant]
ADD CONSTRAINT [PK_Varyant]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Yorumlar'
ALTER TABLE [dbo].[Yorumlar]
ADD CONSTRAINT [PK_Yorumlar]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [KargoId] in table 'SiparisDetay'
ALTER TABLE [dbo].[SiparisDetay]
ADD CONSTRAINT [FK_SiparisDetay_KargoFirmasi]
    FOREIGN KEY ([KargoId])
    REFERENCES [dbo].[KargoFirmasi]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiparisDetay_KargoFirmasi'
CREATE INDEX [IX_FK_SiparisDetay_KargoFirmasi]
ON [dbo].[SiparisDetay]
    ([KargoId]);
GO

-- Creating foreign key on [KategoriId] in table 'Ozellik'
ALTER TABLE [dbo].[Ozellik]
ADD CONSTRAINT [FK_Ozellik_Kategoriler]
    FOREIGN KEY ([KategoriId])
    REFERENCES [dbo].[Kategoriler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Ozellik_Kategoriler'
CREATE INDEX [IX_FK_Ozellik_Kategoriler]
ON [dbo].[Ozellik]
    ([KategoriId]);
GO

-- Creating foreign key on [KategoriID] in table 'Urunler'
ALTER TABLE [dbo].[Urunler]
ADD CONSTRAINT [FK_Urunler_Kategoriler]
    FOREIGN KEY ([KategoriID])
    REFERENCES [dbo].[Kategoriler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Urunler_Kategoriler'
CREATE INDEX [IX_FK_Urunler_Kategoriler]
ON [dbo].[Urunler]
    ([KategoriID]);
GO

-- Creating foreign key on [KategoriId] in table 'Varyant'
ALTER TABLE [dbo].[Varyant]
ADD CONSTRAINT [FK_Varyant_Kategoriler]
    FOREIGN KEY ([KategoriId])
    REFERENCES [dbo].[Kategoriler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Varyant_Kategoriler'
CREATE INDEX [IX_FK_Varyant_Kategoriler]
ON [dbo].[Varyant]
    ([KategoriId]);
GO

-- Creating foreign key on [LoginId] in table 'Musteri'
ALTER TABLE [dbo].[Musteri]
ADD CONSTRAINT [FK_musteri_Login]
    FOREIGN KEY ([LoginId])
    REFERENCES [dbo].[Login]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_musteri_Login'
CREATE INDEX [IX_FK_musteri_Login]
ON [dbo].[Musteri]
    ([LoginId]);
GO

-- Creating foreign key on [SepetId] in table 'Musteri'
ALTER TABLE [dbo].[Musteri]
ADD CONSTRAINT [FK_musteri_SepetId]
    FOREIGN KEY ([SepetId])
    REFERENCES [dbo].[SepetId]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_musteri_SepetId'
CREATE INDEX [IX_FK_musteri_SepetId]
ON [dbo].[Musteri]
    ([SepetId]);
GO

-- Creating foreign key on [SiparisGecmisId] in table 'Musteri'
ALTER TABLE [dbo].[Musteri]
ADD CONSTRAINT [FK_musteri_SiparisGecmisi]
    FOREIGN KEY ([SiparisGecmisId])
    REFERENCES [dbo].[SiparisGecmisi]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_musteri_SiparisGecmisi'
CREATE INDEX [IX_FK_musteri_SiparisGecmisi]
ON [dbo].[Musteri]
    ([SiparisGecmisId]);
GO

-- Creating foreign key on [MusteriID] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_Siparis_musteri]
    FOREIGN KEY ([MusteriID])
    REFERENCES [dbo].[Musteri]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Siparis_musteri'
CREATE INDEX [IX_FK_Siparis_musteri]
ON [dbo].[Siparis]
    ([MusteriID]);
GO

-- Creating foreign key on [MusteriId] in table 'Yorumlar'
ALTER TABLE [dbo].[Yorumlar]
ADD CONSTRAINT [FK_Yorumlar_musteri]
    FOREIGN KEY ([MusteriId])
    REFERENCES [dbo].[Musteri]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Yorumlar_musteri'
CREATE INDEX [IX_FK_Yorumlar_musteri]
ON [dbo].[Yorumlar]
    ([MusteriId]);
GO

-- Creating foreign key on [OdemeYontemiId] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_Siparis_OdemeYontemi]
    FOREIGN KEY ([OdemeYontemiId])
    REFERENCES [dbo].[OdemeYontemi]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Siparis_OdemeYontemi'
CREATE INDEX [IX_FK_Siparis_OdemeYontemi]
ON [dbo].[Siparis]
    ([OdemeYontemiId]);
GO

-- Creating foreign key on [OdemeYontemId] in table 'SiparisDetay'
ALTER TABLE [dbo].[SiparisDetay]
ADD CONSTRAINT [FK_SiparisDetay_OdemeYontemi]
    FOREIGN KEY ([OdemeYontemId])
    REFERENCES [dbo].[OdemeYontemi]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiparisDetay_OdemeYontemi'
CREATE INDEX [IX_FK_SiparisDetay_OdemeYontemi]
ON [dbo].[SiparisDetay]
    ([OdemeYontemId]);
GO

-- Creating foreign key on [OzellikId] in table 'SiparisDetay'
ALTER TABLE [dbo].[SiparisDetay]
ADD CONSTRAINT [FK_SiparisDetay_Ozellik]
    FOREIGN KEY ([OzellikId])
    REFERENCES [dbo].[Ozellik]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiparisDetay_Ozellik'
CREATE INDEX [IX_FK_SiparisDetay_Ozellik]
ON [dbo].[SiparisDetay]
    ([OzellikId]);
GO

-- Creating foreign key on [OzelliklerId] in table 'UrunVaryant'
ALTER TABLE [dbo].[UrunVaryant]
ADD CONSTRAINT [FK_UrunVaryant_Ozellik]
    FOREIGN KEY ([OzelliklerId])
    REFERENCES [dbo].[Ozellik]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UrunVaryant_Ozellik'
CREATE INDEX [IX_FK_UrunVaryant_Ozellik]
ON [dbo].[UrunVaryant]
    ([OzelliklerId]);
GO

-- Creating foreign key on [UrunId] in table 'SepetId'
ALTER TABLE [dbo].[SepetId]
ADD CONSTRAINT [FK_SepetId_Urunler]
    FOREIGN KEY ([UrunId])
    REFERENCES [dbo].[Urunler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SepetId_Urunler'
CREATE INDEX [IX_FK_SepetId_Urunler]
ON [dbo].[SepetId]
    ([UrunId]);
GO

-- Creating foreign key on [SepetDetayId] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_Siparis_SiparisDetay]
    FOREIGN KEY ([SepetDetayId])
    REFERENCES [dbo].[SiparisDetay]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Siparis_SiparisDetay'
CREATE INDEX [IX_FK_Siparis_SiparisDetay]
ON [dbo].[Siparis]
    ([SepetDetayId]);
GO

-- Creating foreign key on [SiparisDurumuId] in table 'Siparis'
ALTER TABLE [dbo].[Siparis]
ADD CONSTRAINT [FK_Siparis_SiparisDurumu]
    FOREIGN KEY ([SiparisDurumuId])
    REFERENCES [dbo].[SiparisDurumu]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Siparis_SiparisDurumu'
CREATE INDEX [IX_FK_Siparis_SiparisDurumu]
ON [dbo].[Siparis]
    ([SiparisDurumuId]);
GO

-- Creating foreign key on [UrunId] in table 'SiparisDetay'
ALTER TABLE [dbo].[SiparisDetay]
ADD CONSTRAINT [FK_SiparisDetay_Urunler]
    FOREIGN KEY ([UrunId])
    REFERENCES [dbo].[Urunler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiparisDetay_Urunler'
CREATE INDEX [IX_FK_SiparisDetay_Urunler]
ON [dbo].[SiparisDetay]
    ([UrunId]);
GO

-- Creating foreign key on [VaryantId] in table 'SiparisDetay'
ALTER TABLE [dbo].[SiparisDetay]
ADD CONSTRAINT [FK_SiparisDetay_Varyant]
    FOREIGN KEY ([VaryantId])
    REFERENCES [dbo].[Varyant]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SiparisDetay_Varyant'
CREATE INDEX [IX_FK_SiparisDetay_Varyant]
ON [dbo].[SiparisDetay]
    ([VaryantId]);
GO

-- Creating foreign key on [TeslimatId] in table 'Urunler'
ALTER TABLE [dbo].[Urunler]
ADD CONSTRAINT [FK_Urunler_TeslimatBilgileri]
    FOREIGN KEY ([TeslimatId])
    REFERENCES [dbo].[TeslimatBilgileri]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Urunler_TeslimatBilgileri'
CREATE INDEX [IX_FK_Urunler_TeslimatBilgileri]
ON [dbo].[Urunler]
    ([TeslimatId]);
GO

-- Creating foreign key on [UrunId] in table 'UrunVaryant'
ALTER TABLE [dbo].[UrunVaryant]
ADD CONSTRAINT [FK_UrunVaryant_Urunler]
    FOREIGN KEY ([UrunId])
    REFERENCES [dbo].[Urunler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UrunVaryant_Urunler'
CREATE INDEX [IX_FK_UrunVaryant_Urunler]
ON [dbo].[UrunVaryant]
    ([UrunId]);
GO

-- Creating foreign key on [UrunId] in table 'Yorumlar'
ALTER TABLE [dbo].[Yorumlar]
ADD CONSTRAINT [FK_Yorumlar_Urunler]
    FOREIGN KEY ([UrunId])
    REFERENCES [dbo].[Urunler]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Yorumlar_Urunler'
CREATE INDEX [IX_FK_Yorumlar_Urunler]
ON [dbo].[Yorumlar]
    ([UrunId]);
GO

-- Creating foreign key on [VaryantId] in table 'UrunVaryant'
ALTER TABLE [dbo].[UrunVaryant]
ADD CONSTRAINT [FK_UrunVaryant_Varyant]
    FOREIGN KEY ([VaryantId])
    REFERENCES [dbo].[Varyant]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UrunVaryant_Varyant'
CREATE INDEX [IX_FK_UrunVaryant_Varyant]
ON [dbo].[UrunVaryant]
    ([VaryantId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------