package es.albarregas.models;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Utils {
    public static boolean validarParameters(Map<String, String[]> parametros, List<String> opcionales) {
        Boolean error = false;
        for (String s : parametros.keySet()) {
            if (parametros.get(s)[0].isEmpty() && !opcionales.contains(s)) {
                error = true;
            }
        }
        return error;
    }

    public static <T> List<T> convertList(List<?> sourceList, Class<T> targetClass) {
        return sourceList.stream()
                .map(element -> targetClass.cast(element))
                .collect(Collectors.toList());
    }

}
