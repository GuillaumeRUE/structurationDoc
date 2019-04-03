import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;

public class Transformer {

	public static void main(String[] args) throws TransformerConfigurationException {
		
		/**String xslfile = "src/testXSL.xsl";
		String infile = "src/test.xml";
		String outfile = "src/out.xml";**/
		
		String xslfile = "src/transform.xsl";
		String infile = "src/export_overblog.xml";
		String outfile = "src/out2.xml";
		
		StreamSource xslcode = new StreamSource(new File(xslfile));
		StreamSource input = new StreamSource(new File(infile));
		StreamResult output = new StreamResult(new File(outfile));
		
		TransformerFactory tf = TransformerFactory.newInstance();
		
		javax.xml.transform.Transformer trans;
		try {
			trans = tf.newTransformer(xslcode);
			trans.transform(input,output);
			
		} 
		catch (TransformerException e) {
			e.printStackTrace();
		}
		

	}

}
