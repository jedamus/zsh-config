


# modifiziert Samstag, 26. September 2020 19:31 von Leander Jedamus

Start Restart Stop Reload()
{
  sudo /etc/init.d/$1 ${0:l}
};# Start Restart Stop Reload

R()
{
  less -- (#ia3)readme;
};# R

aliased()
{
  vared "aliases[$1]"
};# aliased

funced()
{
  vared "functions[$1]"
};# funced
