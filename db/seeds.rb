# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Submission.delete_all
Meeting.delete_all
User.delete_all
Comment.delete_all

User.create username: 'Spongebob Squarepants', email: 'user1@example.org', password: 'user1pw'
User.create username: 'Patrick', email: 'user2@example.org', password: 'user2pw'
User.create username: 'admin', email: 'admin@example.org', password: 'admin'

Meeting.create title: '06-29-2022'

submissions = [
  {
    "content" => '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Isto modo, ne si avia quidem eius nata non esset. Sit hoc ultimum bonorum, quod nunc a me defenditur; Memini me adesse P. <i>Quae ista amicitia est?</i> Sed eum qui audiebant, quoad poterant, defendebant sententiam suam. Duo Reges: constructio interrete. Eaedem res maneant alio modo. Tubulum fuisse, qua illum, cuius is condemnatus est rogatione, P. At habetur! Et ego id scilicet nesciebam! Sed ut sit, etiamne post mortem coletur? Sin kakan malitiam dixisses, ad aliud nos unum certum vitium consuetudo Latina traduceret. </p>

    <p><b>Tu vero, inquam, ducas licet, si sequetur;</b> Habes, inquam, Cato, formam eorum, de quibus loquor, philosophorum. Apparet statim, quae sint officia, quae actiones. <i>Tum Triarius: Posthac quidem, inquit, audacius.</i> Quippe: habes enim a rhetoribus; Hoc loco tenere se Triarius non potuit. </p>
    
    <p><i>Negat enim summo bono afferre incrementum diem.</i> Non dolere, inquam, istud quam vim habeat postea videro; Quae quidem sapientes sequuntur duce natura tamquam videntes; Quis enim redargueret? Est enim tanti philosophi tamque nobilis audacter sua decreta defendere. <i>Proclivi currit oratio.</i> </p>
    ',
    "meeting" => "06-29-2022",
    "creator" => "user1@example.org",
  },
  {
    "content" => '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Inquit, dasne adolescenti veniam? <b>Ne amores quidem sanctos a sapiente alienos esse arbitrantur.</b> Tum Quintus: Est plane, Piso, ut dicis, inquit. Ex quo intellegitur officium medium quiddam esse, quod neque in bonis ponatur neque in contrariis. Illa sunt similia: hebes acies est cuipiam oculorum, corpore alius senescit; Vide, quaeso, rectumne sit. <a href="http://loripsum.net/" target="_blank">Cur, nisi quod turpis oratio est?</a> Duo Reges: constructio interrete. <b>Conferam avum tuum Drusum cum C.</b> Sin aliud quid voles, postea. Ergo hoc quidem apparet, nos ad agendum esse natos. Quonam, inquit, modo? </p>

    <p>Non est igitur voluptas bonum. Dici enim nihil potest verius. Non est enim vitium in oratione solum, sed etiam in moribus. Plane idem, inquit, et maxima quidem, qua fieri nulla maior potest. <a href="http://loripsum.net/" target="_blank">Quod totum contra est.</a> Quid est, quod ab ea absolvi et perfici debeat? </p>
    
    <p><i>Tecum optime, deinde etiam cum mediocri amico.</i> Moriatur, inquit. Atque haec ita iustitiae propria sunt, ut sint virtutum reliquarum communia. Ut enim consuetudo loquitur, id solum dicitur honestum, quod est populari fama gloriosum. <a href="http://loripsum.net/" target="_blank">Nam quid possumus facere melius?</a> Sit hoc ultimum bonorum, quod nunc a me defenditur; Quod iam a me expectare noli. <a href="http://loripsum.net/" target="_blank">Est enim effectrix multarum et magnarum voluptatum.</a> </p>
    ',
    "meeting" => "06-29-2022",
    "creator" => "user2@example.org",
  },
]
comments_2 = [
  {
    "content" => "Poignant, powerful, and masterfully crafted. Love it!!",
    "creator" => "user2@example.org",
  },
  {
    "content" => "Thank you!",
    "creator" => "user1@example.org",
  },
]

comments_1 = [
  {
    "content" => "This is the <b>best</b> thing I've <i>ever</i> read <strike> since birth </strike>",
    "creator" => "user1@example.org",
  },
  {
    "content" => "Thank you!",
    "creator" => "user2@example.org",
  },
]

submissions.each_with_index do |submission,index|
  s = Submission.new
  s.content = submission["content"]
  s.user = User.find_by(email: submission["creator"])
  s.meeting = Meeting.find_by(title: submission["meeting"])
  s.save!
end


c = Comment.new
c.content = comments_1.first["content"]
c.user = User.find_by(email: comments_2.first["creator"])
c.submission = Submission.first
c.save!

d = Comment.new
d.content = comments_2.last["content"]
d.user = User.find_by(email: comments_2.last["creator"])
d.submission = Submission.first
d.save!

c = Comment.new
c.content = comments_2.first["content"]
c.user = User.find_by(email: comments_1.first["creator"])
c.submission = Submission.last
c.save!

d = Comment.new
d.content = comments_1.last["content"]
d.user = User.find_by(email: comments_1.last["creator"])
d.submission = Submission.last
d.save!

print "There are now #{User.count} users in the database.\n"
print "There are now #{Submission.count} books in the database.\n"
print "There are now #{Meeting.count} meetings in the database.\n"
print "There are now #{Comment.count} comments in the database.\n"
