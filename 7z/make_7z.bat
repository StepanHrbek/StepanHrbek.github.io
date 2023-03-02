rem patch GetLogPath v CPP\7zip\UI\Common\EnumDirItems.cpp
rem Z CPP\Build.mak smaz -OPT:NOWIN98

call "%vs100comntools%vsvars32.bat"
cd CPP\7zip\UI\Console
nmake
exit



kompilace z VS
______________

z CPP\7zip\UI\Console\Console.dsp smazat -omf a /OPT:NOWIN98
ve VS2010 otevri CPP\7zip\UI\Console\Console.dsw
(neotestovano)


patch
_____

//UString CDirItems::GetLogPath(int index) const
//{
//  const CDirItem &di = Items[index];
//  return GetPrefixesPath(LogParents, di.LogParent, di.Name);
//}
UString CDirItems::GetLogPath(int index) const
{
  int pos;
  UString path = GetPhyPath(index);
  if (path.Length()>=2 && path[1]==':') path.Delete(0,2); // delete "c:"
  if (path.Length()>=2 && path[0]=='\\' && path[1]=='\\' && (pos=path.Find('\\',2))>0) path.Delete(0,pos); // delete "\\192.168.1.10"
  if (path.Length()==0 || path[0]!='\\') path.Insert(0,'\\'); // insert "\"
  while ((pos=path.Find(L"\\..\\"))>=0) path.Delete(0,pos+3); // delete "foo\bar\.."
  while ((pos=path.Find(L"\\.\\"))>=0) path.Delete(0,pos+2); // delete "foo\bar\."
  while (path.Length()>0 && path[0]=='\\') path.Delete(0,1); // delete "\"
  return path;
}
