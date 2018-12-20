package common;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Util {

    public static void main(String[] args) throws IOException {
        
        List<File> list = getImgFileList("WebContent/imgUp");
        
        for(File f : list) {
            System.out.println(f.getName()); 
        }
    }
    
    
    public static List<File> getImgFileList(String path){        
         
        return getImgFileList(new File(path));
    }    
    public static List<File> getImgFileList(File file){        
            
        List<File> resultList = new ArrayList<File>(); 
        if(!file.exists()) return resultList;
        
        File[] list = file.listFiles(new FileFilter() { 
            String strImgExt = "jpg|jpeg|png|gif|bmp"; 
            @Override
            public boolean accept(File pathname) {                            
                boolean chkResult = false;
                if(pathname.isFile()) {
                    String ext = pathname.getName().substring(pathname.getName().lastIndexOf(".")+1);
                    chkResult = strImgExt.contains(ext.toLowerCase());        
                } else {
                    chkResult = true;
                }
                return chkResult;
            }
        });        
        
        int count =0;

        for(File f : list) {            
            if(f.isDirectory()) {
                resultList.addAll(getImgFileList(f));                 
            }else {            
                resultList.add(f);
            }
            count++;
        }            
        return resultList; 
    }
    public static String getFileNameNoExt(String filepath){        
        String fileName = filepath.substring(0,  filepath.lastIndexOf("."));
        return fileName;
    }    
    
    public static String getFileExt(String filepath){
        String ext = filepath.substring(filepath.lastIndexOf(".")+1);
        return ext;
    }
    
    public static String getImgSrc(File target){
        String url = target.getPath().substring(target.getPath().lastIndexOf("imgUp"));
        return url;
    }
}