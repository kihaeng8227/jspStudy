package market.dao;

import market.dto.Product;

import java.util.ArrayList;

public class ProductRepository {
    private ArrayList<Product> listOfProducts = new ArrayList<Product>();
    private static ProductRepository instance = new ProductRepository();

    public static ProductRepository getInstance() {
        return instance;
    }

    public ProductRepository() {
        Product phone = new Product("P1234", "iPhone 6s", 800000);
        phone.setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixel iSight Camera");
        phone.setCategory("Smart Phone");
        phone.setManufacturer("Apple");
        phone.setUnitsInStock(1000);
        phone.setCondition("New");
        phone.setFilename("P1234.png");

        Product notebook = new Product("P1235", "LG PC 그램", 1500000);
        notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
        notebook.setCategory("Notebook");
        notebook.setManufacturer("LG");
        notebook.setUnitsInStock(1000);
        notebook.setCondition("Refurbished");
        notebook.setFilename("P1235.png");

        Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
        tablet.setDescription("121.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
        tablet.setCategory("Tablet");
        tablet.setManufacturer("Samsung");
        tablet.setUnitsInStock(1000);
        tablet.setCondition("Old");
        tablet.setFilename("P1236.png");

        listOfProducts.add(phone);
        listOfProducts.add(notebook);
        listOfProducts.add(tablet);
    }

    public ArrayList<Product> getAllProducts() {
        return listOfProducts;
    }


    public Product getProductById(String productId) {
        // ProductDto 타입의 메서드인 getProductById ( 매개변수로 String 타입의 productId 사용)
        Product productById = null;
        // ProductDto 타입의 참조변수를 null; 설정.

        for (int i = 0; i < listOfProducts.size(); i++) {
            // 해당 클래수의 listOfProducts 가 가지고 있는 배열을 순회하는 과정
            Product product = listOfProducts.get(i);
            if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
                // 순회중인 배열들이 null 이 아니고, id 가 null이 아니고, 그리고 순회중 확인하는 아이디와 매개변수로 들어오는 아이디가 같다면
                productById = product;
               // 기존 null 이었더 값을 ProductDto 타입의 product 로 저장.
                break;
               // 아이디가 같다면 break; 아니라면 배열이 끝날떄 까지 전체 순회.
            }
        }
        return productById; // 그리고 저장된 값은 같은 아이디가 있다면 해당 아이디를 반환, 아니라면 null 을 반환한다
    }

    public void addProduct(Product product) {
        listOfProducts.add(product);
    }

}
