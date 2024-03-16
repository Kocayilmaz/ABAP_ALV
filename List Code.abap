








Bu iki işlev, kullanıcının belirli bir dosyayı görüntülemesini veya indirmesini sağlar.view_file(folder_id, file_name)

Belirli bir dosyayı görüntülemek için kullanılır.
Dosyanın fiziksel yolunu oluşturmak için UPLOAD_FOLDER, kullanıcının kimliği (session['id']) ve klasör kimliği (folder_id) kullanılır.
Dosyanın fiziksel yolunu içeren destination değişkeni oluşturulur.
Dosyanın adı ve klasör kimliği (ID) ekrana yazdırılır (bu satırın amacı muhtemelen hata ayıklama içindir).
send_from_directory fonksiyonuyla belirtilen dizindeki dosya, istemciye doğrudan gönderilir ve kullanıcı tarafından görüntülenir.
download_file(folder_id, file_name)

Belirli bir dosyayı indirmek için kullanılır.
Dosyanın fiziksel yolunu oluşturmak için UPLOAD_FOLDER, kullanıcının kimliği (session['id']) ve klasör kimliği (folder_id) kullanılır.
Dosyanın fiziksel yolunu içeren destination değişkeni oluşturulur.
send_file fonksiyonuyla belirtilen dizindeki dosya, istemciye doğrudan gönderilir ve kullanıcıya indirme seçeneği sunulur (as_attachment=True).
Bu işlevler, kullanıcıların dosyalarını görüntülemelerini veya indirmelerini sağlayarak dosya yönetim uygulamasının temel özelliklerini genişletir.




