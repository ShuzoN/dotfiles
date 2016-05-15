# export SMTP_ADRESS=smtp.gmail.com
# export SMTP_PORT=587
# export EMAIL_DOMAIN=gmail.com
# export SMTP_AUTH=plain
# export SMTP_TLS=false
# export EMAIL_USERNAME=d.namu.r21@gmail.com
# export EMAIL_BCC='d.namu.r21@gmail.com'
# export EMAIL_PASSWORD=tpuslkxjcfhcnjwv # gmailの場合は2段階認証を設定後, アプリ固有のパスワードを設定する
# export EMAIL_SENDER='Shuzo Nakamura <d.namu.r21@gmail.com>'
# export DEFAULT_URL=https://nutfes-group-manager.herokuapp.com
# ---------
export SMTP_ADRESS=stn.nagaokaut.ac.jp
export SMTP_PORT=465
export EMAIL_DOMAIN=stn.nagaokaut.ac.jp
export SMTP_AUTH=plain
export SMTP_TLS=true
export DEFAULT_URL=https://nutfes-group-manager.herokuapp.com

. $HOME/dotfiles/group_manager_email.sh
. $HOME/dotfiles/group_manager_pw.sh
export RAILS_SERVE_STATIC_FILES=true

# group-manager用にgemfileのパスを変更
gemlocal="Gemfile.local"
if [ -f ${gemlocal} ]; then
  echo "Gemfile.local exist!"
  export BUNDLE_GEMFILE="Gemfile.local"
else
  unset BUNDLE_GEMFILE
fi
