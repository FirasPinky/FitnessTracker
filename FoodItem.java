package SA;

public class FoodItem {
    private String name;
    private double calories;

    public FoodItem(String name, double calories) {
        this.name = name;
        this.calories = calories;
    }

    public String getName() {
        return name;
    }

    public double getCalories() {
        return calories;
    }
}
