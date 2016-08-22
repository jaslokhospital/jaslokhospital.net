Type.registerNamespace("DotNetNuke.UI.WebControls.Utility");DotNetNuke.UI.WebControls.Utility.recurseElement=function(prefix,element)
{var info=[];for(var e in element)
{if(typeof(element[e])=="object")
{var values=DotNetNuke.UI.WebControls.Utility.recurseElement(prefix+e+".",element[e]);for(var v in values)
info[v]=values[v];}
else
info[prefix+e]=element[e];}
return(info);}
DotNetNuke.UI.WebControls.Utility.createStyleSheet=function(url)
{if(document.createStyleSheet)
document.createStyleSheet(url);else
{var head=document.getElementsByTagName("head")[0];var newStyleSheet=document.createElement("link");newStyleSheet.rel="stylesheet";newStyleSheet.type="text/css";newStyleSheet.href=url;newStyleSheet.disabled=true;head.appendChild(newStyleSheet);newStyleSheet.disabled=false;}}
DotNetNuke.UI.WebControls.Utility.checkEnter=function(event,clickHandlerId)
{var NS4=(document.layers)?true:false;var code=0;if(NS4)
code=event.which;else
code=event.keyCode;if(code==13)
{var clickHandler=$get(clickHandlerId);clickHandler.click();return(false);}}
DotNetNuke.UI.WebControls.Utility.getCookie=function(name)
{var start=document.cookie.indexOf(name+"=");var len=start+name.length+1;if((!start)&&(name!=document.cookie.substring(0,name.length)))
return null;if(start==-1)
return null;var end=document.cookie.indexOf(";",len);if(end==-1)
end=document.cookie.length;return unescape(document.cookie.substring(len,end));}
DotNetNuke.UI.WebControls.Utility.setCookie=function(name,value,expires,path,domain,secure)
{var today=new Date();today.setTime(today.getTime());if(expires)
expires=expires*1000*60*60*24;var expires_date=new Date(today.getTime()+(expires));document.cookie=name+"="+escape(value)+((expires)?";expires="+expires_date.toGMTString():"")+((path)?";path="+path:"")+((domain)?";domain="+domain:"")+((secure)?";secure":"");}
DotNetNuke.UI.WebControls.Utility.deleteCookie=function(name,path,domain)
{if(DotNetNuke.UI.WebControls.Utility.getCookie(name))
document.cookie=name+"="+((path)?";path="+path:"")+((domain)?";domain="+domain:"")+";expires=Thu, 01-Jan-1970 00:00:01 GMT";}
String.prototype.replaceAll=function(find,replace)
{var str=this;str+="";var indexOfMatch=str.indexOf(find);while(indexOfMatch!=-1)
{str=str.replace(find,replace);indexOfMatch=str.indexOf(find);}
return(str);}
String.prototype.xmlEntityReplace=function()
{var str=this;str+="";str=str.replace(/&amp;/gi,"&");str=str.replace(/&quot;/gi,"\"");str=str.replace(/&apos;/gi,"'");str=str.replace(/&lt;/gi,"<");str=str.replace(/&gt;/gi,">");return(str);}
String.prototype.urlEncode=function()
{var str=this;str+="";str=escape(str).replace(/\+/gi,"%20");str=str.replace(/\//gi,"%2F");str=str.replace(/%26/gi,"%26amp%3B");return(str);}
DotNetNuke.UI.WebControls.BaseControl=function(instanceVarName,resourcesFolderUrl,theme,elementIdPrefix)
{if(!instanceVarName)
return(null);this._instanceVarName=instanceVarName;this._elementIdPrefix=(typeof(elementIdPrefix)=="undefined"?"":elementIdPrefix);this._control="Shared";this._theme=theme;this._resourcesFolderUrl=(typeof(resourcesFolderUrl)=="undefined"?"Resources/":resourcesFolderUrl);this._styleSheetUrl="";this._stylePrefix="";}
DotNetNuke.UI.WebControls.BaseControl.prototype={getStylePrefix:function()
{if(this._stylePrefix=="")
return(this._control+"-"+this._theme+"-");else
return(this._stylePrefix);},getTheme:function()
{return(this._theme);},getResourcesFolderUrl:function()
{return(this._resourcesFolderUrl);},getElementIdPrefix:function()
{return(this._elementIdPrefix);},getInstanceVarName:function()
{return(this._instanceVarName);},getStyleSheetUrl:function()
{return(this._styleSheetUrl);},setTheme:function(theme)
{this._theme=theme;},setResourcesFolderUrl:function(resourcesFolderUrl)
{this._resourcesFolderUrl=resourcesFolderUrl;},setElementIdPrefix:function(elementIdPrefix)
{this._elementIdPrefix=elementIdPrefix;},setInstanceVarName:function(instanceVarName)
{this._instanceVarName=instanceVarName;},setStylePrefix:function(stylePrefix)
{this._stylePrefix=stylePrefix;},setStyleSheetUrl:function(styleSheetUrl)
{this._styleSheetUrl=styleSheetUrl;},displayLoader:function()
{return("<div class=\""+this.getStylePrefix()+"Loader\">&nbsp;</div>");},addStyleSheet:function()
{var url=this._resourcesFolderUrl+this._control+"/themes/"+this._theme+"/"+this._theme+".css";if(this._styleSheetUrl!="")
url=this._styleSheetUrl;DotNetNuke.UI.WebControls.Utility.createStyleSheet(url);}}
DotNetNuke.UI.WebControls.BaseControl.registerClass("DotNetNuke.UI.WebControls.BaseControl");function $DEBUG(s,overWrite)
{var dc=$get("DebugConsole");if(dc!=null)
{if(overWrite)
dc.innerHTML=s;else
dc.innerHTML+=s;}}
function $DEBUGLINE(s,overWrite)
{$DEBUG(s+"<br />",overWrite);}