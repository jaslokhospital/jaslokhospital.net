Type.registerNamespace("DotNetNuke.UI.WebControls.Widgets");DotNetNuke.UI.WebControls.Widgets.BaseWidget=function(widget)
{if(!widget)
return(null);this._widget=widget;this._dependencies=[];this._readyCounter=0;}
DotNetNuke.UI.WebControls.Widgets.BaseWidget.prototype={getWidget:function()
{return(this._widget);},getParams:function()
{return(this._widget.childNodes);},setDependency:function(className,scriptPath,isResource)
{if(typeof(eval(className))==="undefined")
{if(isResource)
$.getScript($dnn.baseResourcesUrl+scriptPath);else
$.getScript(scriptPath);this._dependencies.push(className);}},onReady:function(handler,errorHandler,attempts,interval)
{this._handler=handler;if(errorHandler)
this._errorHandler=errorHandler;else
this._errorHandler="alert('Error loading dependent classes:[ERRORCLASSES]')";if((attempts)&&(attempts>0))
this._attempts=attempts;else
this._attempts=100;if((interval)&&(interval>10))
this._interval=interval;else
this._interval=10;this._checkIfReady(this);},elementHTML:function(element)
{if(element==null)
return("");var _emptyTags={"IMG":true,"BR":true,"INPUT":true,"META":true,"LINK":true,"PARAM":true,"HR":true};var attrs=element.attributes;var str="<"+element.tagName;for(var i=0;i<attrs.length;i++)
str+=" "+attrs[i].name+"=\""+attrs[i].value+"\"";if(_emptyTags[element.tagName])
return(str+"/>");return(str+">"+element.innerHTML+"</"+element.tagName+">");},_checkIfReady:function(self)
{self._readyCounter++;if(self._readyCounter>self._attempts)
{var errorClasses="";for(var d=0;d<self._dependencies.length;d++)
{if(self._dependencies[d]!="")
errorClasses+=" "+self._dependencies[d];}
eval(self._errorHandler.replace("[ERRORCLASSES]",errorClasses));return;}
var ready=true;for(var d=0;d<self._dependencies.length;d++)
{if(self._dependencies[d]!="")
{if(typeof(eval(self._dependencies[d]))==="undefined")
{ready=false;window.setTimeout(function(){self._checkIfReady(self);},self._interval);break;}
else
self._dependencies[d]="";}}
if(ready)
eval(self._handler);},render:function(element)
{element.id=this._widget.id;this._widget.parentNode.replaceChild(element,this._widget);}}
DotNetNuke.UI.WebControls.Widgets.BaseWidget.inheritsFrom(Sys.Component);DotNetNuke.UI.WebControls.Widgets.BaseWidget.registerClass("DotNetNuke.UI.WebControls.Widgets.BaseWidget",Sys.Component);var $widgets=new Object();$widgets.rendered=false;$widgets.pageWidgets=new Array();$widgets.pageWidgetDetectionAttempts=0;$widgets.pageWidgetRenderAttempts=new Array();DotNetNuke.UI.WebControls.Widgets.renderWidgets=function()
{if($widgets.rendered)return;$widgets.rendered=true;var objects=document.getElementsByTagName("object");if((objects==null)||(objects.length==0))
{if($widgets.pageWidgetDetectionAttempts<1000)
{window.setTimeout(DotNetNuke.UI.WebControls.Widgets.renderWidgets,5);$widgets.pageWidgetDetectionAttempts++;}
return;}
var pageWidgetClasses=new Array();for(var o=0;o<objects.length;o++)
{try
{if((objects[o].codeType.toLowerCase()=="dotnetnuke/client")&&(objects[o].id!=""))
{$widgets.pageWidgets.push(objects[o]);var widgetType=objects[o].codeBase;if(widgetType.indexOf("/")>0)
widgetType=widgetType.substr(widgetType.lastIndexOf("/")+1);objects[o].codeBase=(widgetType.indexOf(".")<0?"DotNetNuke.UI.WebControls.Widgets."+widgetType:widgetType);if(typeof(pageWidgetClasses[widgetType])==="undefined")
{pageWidgetClasses[widgetType]=widgetType;if(widgetType.indexOf(".")>-1)
{var widgetFolder=widgetType.substr(0,widgetType.indexOf("."));$.getScript($dnn.baseResourcesUrl+"Widgets/User/"+widgetFolder+"/"+widgetType+".js");}
else
$.getScript($dnn.baseResourcesUrl+"Widgets/DNN/"+widgetType+".js");}}}
catch(e)
{}}
delete pageWidgetClasses;}
DotNetNuke.UI.WebControls.Widgets.renderWidgetType=function(widgetType)
{try
{if(typeof(eval(widgetType))==="function")
{for(var w=0;w<$widgets.pageWidgets.length;w++)
{try
{var currentWidgetInstance=$widgets.pageWidgets[w].codeBase;if(currentWidgetInstance.indexOf("/")>0)
currentWidgetInstance=currentWidgetInstance.substr(currentWidgetInstance.lastIndexOf("/")+1);if(currentWidgetInstance!=widgetType)
continue;var widget=eval("new "+widgetType+"($widgets.pageWidgets[w])");widget.render();}
catch(r)
{}}}}
catch(e)
{}}
$addHandler(window,"load",DotNetNuke.UI.WebControls.Widgets.renderWidgets);$renderDNNWidgets();function $renderDNNWidgets()
{if($widgets.rendered)return;window.setTimeout(DotNetNuke.UI.WebControls.Widgets.renderWidgets,20);}