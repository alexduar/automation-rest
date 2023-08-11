package api;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class CommonsUtils {

    static JSONParser jsonP;
    public static String valor;
    private static String path;
    private static Object indice;
    private static Object campo;
    private static String[] valores;

    public static void separaValoresJson(String arquivoIndiceCampo){
        jsonP = new JSONParser();
        valores = arquivoIndiceCampo.split("\\.");
        path = valores[0];
        indice = valores[1];
        if(valores.length > 2){
            campo = valores[2];
        }
    }

    public static String pegarValorJson(String arquivoIndice){
        separaValoresJson(arquivoIndice);
        try {
            Object value = jsonP.parse(new FileReader("src/test/resources/" + path + ".json"));
            JSONObject jsonObj  = (JSONObject) value;
            if(valores.length <= 2) {
                return valor = (String) jsonObj.get(indice);
            }else {
                JSONObject infoConta = (JSONObject) jsonObj.get(indice);
                return valor = (String) infoConta.get(campo);
            }
        } catch (FileNotFoundException e) {
            return "Valor/arquivo não encontrado";
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return valor;
    }

    public static String ajustaPath(String dados){
        String dado = dados.replaceAll(": ", "=");
        String dadosLimpos = dado.replaceAll(", ", "&");
        return dadosLimpos;
    }

    public static String regex(String value){
        String dado = value.replaceAll("\\[", "");
        String dado1 = dado.replaceAll("\\.", "");
        String dado2 = dado1.replaceAll("\"", "");
        String dado3 = dado2.replaceAll("]", "");
        String dado4 = dado3.replaceAll(" ", "");
        return dado4;
    }

    public static String getEnvironmentVariable(String key){
        return pegarValorJson("environment/main." + key);
    }

    public static String getSecurityVariables(String key){
        return pegarValorJson("keys." + key);
    }

    public static File pegaContratoJson(String arquivo){
        return new File("src/test/resources/schemas/" + arquivo + ".json");
    }
}
