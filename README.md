# ABAP ALV Program 🚀

This ABAP program is designed to display a list using ALV (ABAP List Viewer) in the SAP system. It follows these steps:

## Steps 📋

- **SELECTION-SCREEN Block 🖥️:** This block creates a screen for user input. In this example, some input fields are defined using PARAMETERS and SELECT-OPTIONS.

- **START-OF-SELECTION Block ⚙️:** This block contains the operations to be executed when the process starts. In this example, data is selected from the `knb1` table based on specific conditions and transferred to an internal table called `gt_list`. Then, additional fields are populated using related tables (`kna1`, `knvv`, `adr6`, `t151t`, `t171t`, `tvkbt`, `tvgrt`).

- **CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE' 🗂️:** This function creates the ALV field catalog. It is used to define the fields, filters, and other properties of the ALV screen.

- **CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY' 📊:** This function displays the ALV grid screen using the created ALV field catalog. Screen layout (`is_layout`) and field catalog (`it_fields`) are provided through the parameters of this function.

- **FORM standard 🔧:** This form performs standard operations. For example, it defines the PF-STATUS (function key status).

- **FORM user_command 👨‍💻:** This form handles user commands (e.g., save). In this example, when the user performs the "SAVE" action, the data is saved to the `ZFI_CKML_ACD_V1` table.

In this way, the ABAP program collects user input, retrieves data from the database, creates an ALV screen, and allows the user to view and interact with the data. 🎉

---
___
---

# ABAP ALV Programı 🚀

Bu ABAP programı, SAP sisteminde ALV (ABAP List Viewer) kullanarak bir liste görüntülemek için oluşturulmuştur. Aşağıdaki adımları izler:

## Adımlar 📋

- **SELECTION-SCREEN Bloğu 🖥️:** Bu blok, kullanıcı girişi için bir ekran oluşturur. Bu örnekte, PARAMETERS ve SELECT-OPTIONS kullanılarak bazı giriş alanları tanımlanmıştır.

- **START-OF-SELECTION Bloğu ⚙️:** Bu blok, işlem başladığında gerçekleştirilecek işlemleri içerir. Bu örnekte, `knb1` tablosundan belirli koşullara uygun verileri seçerek `gt_list` adlı bir iç tabloya aktarılmıştır. Ardından bu verilerle ilişkili diğer tablolar (`kna1`, `knvv`, `adr6`, `t151t`, `t171t`, `tvkbt`, `tvgrt`) kullanılarak bazı alanlar doldurulmuştur.

- **CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE' 🗂️:** Bu işlev, ALV alan kataloğunu oluşturur. Bu işlev, ALV ekranının alanlarını, filtrelerini ve diğer özelliklerini belirlemek için kullanılır.

- **CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY' 📊:** Bu işlev, oluşturulan ALV alan kataloğunu kullanarak ALV grid ekranını görüntüler. Ekran düzeni (`is_layout`) ve alan kataloğu (`it_fields`) bu işlevin parametreleri aracılığıyla sağlanır.

- **FORM standard 🔧:** Bu form, standart işlemleri gerçekleştirir. Örneğin, PF-STATUS'ı (function key status) belirler.

- **FORM user_command 👨‍💻:** Bu form, kullanıcı işlemlerini (örneğin, kaydetme) işler. Bu örnekte, kullanıcı "SAVE" işlemi gerçekleştirdiğinde `ZFI_CKML_ACD_V1` tablosuna verilerin kaydedilmesi sağlanmıştır.

Bu şekilde, ABAP programı kullanıcıdan giriş alır, veritabanından verileri alır, bir ALV ekranı oluşturur ve kullanıcının bu verileri görüntülemesini ve işlem yapmasını sağlar. 🎉

