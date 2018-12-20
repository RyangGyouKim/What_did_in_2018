<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="image_list" id="image_list" >
	
	<%
    	String strImgConFormat1 = "<div class=\"images\" align='center'>"
                              + "<span class=\"imgTitle\">▒ %s ▒</span>"
                              + "<img width='300px' height='300px' src=\"%s\"/></div>";

		for(int i = imgFileList.size()-1; i>=0;i--) {
			int count =0;
			File f = imgFileList.get(i);
			String title = Util.getFileNameNoExt(f.getName());
           	//System.out.println(f.getName()+"/"+title);
           	String url = Util.getImgSrc(f);
           	out.print(String.format(strImgConFormat1, title,  url ));
       }
   %>
</div>

<amp-auto-ads type="adsense"
              data-ad-client="ca-pub-3610851599463829">
</amp-auto-ads>

<!--footer  -->
<div id="footer" style="background-color:#33DAFF; height: 90px; width:100%; clear:both; text-align:center; margin:auto 0px;">
	<h5 style="padding-top:40px"> All Rights Are Reserved By DYB Team and maker Ryan</h5>
</div>