# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
   email: 'adm@adm0',
   password: 'admin0'
)

User.create(
  [
    {email: 'akasaka@example.com', name: '赤坂龍斗', password: 'password', introduction: '筋トレを趣味にしています。', status: 0, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'kawanaka@example.com', name: '川中恵', password: 'password', introduction: '最近体重が気になり始めました。', status: 0, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'sayakawa@example.com', name: '鞘河晶', password: 'password', introduction: '資格の勉強を頑張りたいです。', status: 0, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'takahama@example.com', name: '高浜一成', password: 'password', introduction: '山に登るのが楽しいです。', status: 0, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'nakama@example.com', name: '仲馬冬樹', password: 'password', introduction: '日本酒が好きです！', status: 0, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'hatanaka@example.com', name: '畑中幸', password: 'password', introduction: '推し活にハマってます！', status: 1, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: 'mataya@example.com', name: '又谷光', password: 'password', introduction: '趣味で音楽始めました。', status: 2, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")}
  ]
)

users = User.all

Post.create(
  [
    {goal: '今年中に体重の2倍のベンチプレスを上げます！', action: '今まで家トレメインでしたが、ジム勢に！', user_id: users[0].id },
    {goal: '夏までに-5kgを目指します', action: '最近流行りの低糖質を意識した食事と隙間時間の運動', user_id: users[1].id },
    {goal: '基本情報技術者の資格をとります。', action: '平日にも時間を作り、最低二時間は勉強に当てます。', user_id: users[2].id },
    {goal: 'この秋に日本最高峰富士山に友人と登頂します', action: '週末には近所の山に行き、体力をつけます。', user_id: users[3].id },
    {goal: '死ぬまでに日本酒制覇', action: '日本酒のサブスクに登録しました。旅先で地酒もいいですね。', user_id: users[4].id },
    {goal: '推しのためにお金を貯める。', action: 'まずは支出を削り、副業にチャレンジします。', user_id: users[5].id },
    {goal: 'ライブを観に行く。', action: '音楽の感性を高めるために、勇気を出して行ってみます。', user_id: users[6].id },
  ]
)

posts = Post.all

Comment.create(
  [
    {user_id: users[1].id, post_id: posts[4].id, comment: '私もお酒好きなんですよ！応援してます！'},
    {user_id: users[0].id, post_id: posts[3].id, comment: '登山は足腰を鍛えるのに最高ですよね！'},
    {user_id: users[2].id, post_id: posts[4].id, comment: 'サブスクなんてあるんですね。'},
    {user_id: users[3].id, post_id: posts[2].id, comment: 'すごいですね。勉強法とかありますか？'},
    {user_id: users[4].id, post_id: posts[0].id, comment: '最近お腹が気になり出したので、いい刺激になります笑'},
    {user_id: users[0].id, post_id: posts[1].id, comment: '食事制限は大切ですよね。一緒に頑張りましょう！'}
  ]
  )