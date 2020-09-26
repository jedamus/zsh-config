

# erzeugt Samstag, 26. September 2020 19:29 (C) 2020 von Leander Jedamus
# modifiziert Samstag, 26. September 2020 20:49 von Leander Jedamus

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

# vim:ai sw=2

