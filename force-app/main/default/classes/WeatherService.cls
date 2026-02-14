public with sharing class WeatherService {
    
    // Define a custom exception for weather service errors
    public class WeatherServiceException extends Exception {}
    
    /**
     * Retrieves weather data for a given location
     * @param location The location to get weather for (could be city name, zip code, etc.)
     * @return A WeatherData object containing the weather information
     */
    public static WeatherData getWeatherData(String location) {
        try {
            // In a real implementation, this would call an external weather API
            // For now, we'll return mock data to demonstrate the structure
            
            WeatherData weatherData = new WeatherData();
            weatherData.location = location;
            weatherData.temperature = 72.0;
            weatherData.humidity = 65.0;
            weatherData.description = 'Partly Cloudy';
            weatherData.windSpeed = 5.2;
            
            return weatherData;
            
        } catch (Exception e) {
            System.debug('Error retrieving weather data: ' + e.getMessage());
            throw new WeatherServiceException('Failed to retrieve weather data for location: ' + location);
        }
    }
    
    /**
     * Inner class to hold weather data
     */
    public class WeatherData {
        public String location { get; set; }
        public Double temperature { get; set; }
        public Double humidity { get; set; }
        public String description { get; set; }
        public Double windSpeed { get; set; }
        
        public WeatherData() {
            // Default constructor
        }
    }
    
    /**
     * Gets current weather for a specific location using latitude and longitude
     * @param latitude Latitude coordinate
     * @param longitude Longitude coordinate
     * @return WeatherData object with weather information
     */
    public static WeatherData getWeatherByCoordinates(Double latitude, Double longitude) {
        try {
            // In a real implementation, this would call an external weather API
            // using the coordinates to get precise weather data
            
            WeatherData weatherData = new WeatherData();
            weatherData.location = 'Coordinates: ' + latitude + ', ' + longitude;
            weatherData.temperature = 68.0;
            weatherData.humidity = 70.0;
            weatherData.description = 'Sunny';
            weatherData.windSpeed = 3.5;
            
            return weatherData;
            
        } catch (Exception e) {
            System.debug('Error retrieving weather data by coordinates: ' + e.getMessage());
            throw new WeatherServiceException('Failed to retrieve weather data for coordinates: ' + latitude + ', ' + longitude);
        }
    }
}
