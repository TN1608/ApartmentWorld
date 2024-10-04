package java5.asm.services;

import java5.asm.model.province.Province;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ProvincesService {
    private final RestTemplate restTemplate;

    public ProvincesService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public Province[] getProvinces() {
        String url = "https://provinces.open-api.vn/api/?depth=3";
        return restTemplate.getForObject(url, Province[].class);
    }
}
