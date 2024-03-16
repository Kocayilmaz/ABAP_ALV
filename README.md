Bu ABAP programı, SAP sisteminde ALV (ABAP List Viewer) kullanarak bir liste görüntülemek için oluşturulmuştur. Aşağıdaki adımları izler:

SELECTION-SCREEN bloğu: Bu blok, kullanıcı girişi için bir ekran oluşturur. Bu örnekte, PARAMETERS ve SELECT-OPTIONS kullanılarak bazı giriş alanları tanımlanmıştır.

START-OF-SELECTION bloğu: Bu blok, işlem başladığında gerçekleştirilecek işlemleri içerir. Bu örnekte, knb1 tablosundan belirli koşullara uygun verileri seçerek gt_list adlı bir iç tabloya aktarılmıştır. Ardından bu verilerle ilişkili diğer tablolar (kna1, knvv, adr6, t151t, t171t, tvkbt, tvgrt) kullanılarak bazı alanlar doldurulmuştur.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE': Bu işlev, ALV alan kataloğunu oluşturur. Bu işlev, ALV ekranının alanlarını, filtrelerini ve diğer özelliklerini belirlemek için kullanılır.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY': Bu işlev, oluşturulan ALV alan kataloğunu kullanarak ALV grid ekranını görüntüler. Ekran düzeni (is_layout) ve alan kataloğu (it_fields) bu işlevin parametreleri aracılığıyla sağlanır.

FORM standard: Bu form, standart işlemleri gerçekleştirir. Örneğin, PF-STATUS'ı (function key status) belirler.

FORM user_command: Bu form, kullanıcı işlemlerini (örneğin, kaydetme) işler. Bu örnekte, kullanıcı "SAVE" işlemi gerçekleştirdiğinde ZFI_CKML_ACD_V1 tablosuna verilerin kaydedilmesi sağlanmıştır.

Bu şekilde, ABAP programı kullanıcıdan giriş alır, veritabanından verileri alır, bir ALV ekranı oluşturur ve kullanıcının bu verileri görüntülemesini ve işlem yapmasını sağlar.





