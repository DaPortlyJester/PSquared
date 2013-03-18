package com.umich.umd.psquared.classData;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.file.Files;

import com.google.gson.JsonParser;
import com.google.gson.JsonStreamParser;
import com.google.storage.onestore.v3.OnestoreEntity.Path;


public class ClassBuilder {
	
	public ClassBuilder(){
		
	}
	
	public void buildClasses(){
		
		File classFile = new File("classes.json");
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(classFile);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
