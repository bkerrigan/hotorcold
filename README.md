# Is It Hot Or Cold?

Welcome to the Is It Hot Or Cold! 

This Ruby on Rails application allows users to enter an address and receive the current weather conditions for that location. It utilizes various APIs to fetch the weather data and provides a user-friendly interface for displaying the information.

This project is dedicated my 4 year old son who will constantly ask "Daddy, is it hot or cold
today?" in the morning when getting dressed (no matter what the weather was like the previous day).

## Features

- **Address Input**: Users can enter an address in a text field to specify the location for which they want to retrieve weather information.
- **Weather Display**: The application fetches the current weather conditions for the provided address and displays the relevant details such as temperature, wind speed, and weather description.
- **API Integration**: The app integrates with popular weather data APIs to retrieve accurate and up-to-date weather information.

## Prerequisites

Before running this application, ensure that you have the following prerequisites installed on your machine:

- Ruby (version 3.3.2 or higher)
- Ruby on Rails (version 7.0.6 or higher)
- Bundler (for managing gem dependencies)
- PostgreSQL (or any other compatible database)

## Installation

Follow these steps to install and set up the Is It Hot Or Cold?:

1. Clone this repository to your local machine using the following command:

```shell
git clone https://github.com/bkerrigan/hotorcold.git
```

2. Navigate to the project directory:

```shell
cd hotorcold
```

3. Install the required gem dependencies:

```shell
bundle install
```

4. Set up the database by running the following commands:

```shell
rails db:create
rails db:migrate
```

5. Obtain API keys for the weather data providers:

   - Sign up for an account at **OpenWeatherMap** (https://openweathermap.org/) to get an API key.

6. Configure API keys:

   - Edit the credentials file with the API key

     ```shell
     rails credentials:edit
     ```

   - Make a new line for the API key

     ```plaintext
     weather_api_key=your_open_weather_map_api_key
     ```

7. Start the application server:

```shell
rails server
```

8. Open your web browser and navigate to `http://localhost:3000` to access the Is It Hot Or Cold?.

## Usage

Once the application is up and running, follow these steps to use the Is It Hot Or Cold?:

1. On the homepage, you will find an input field labeled "Weather for:"

2. Enter the address for which you want to retrieve weather information. For example, you can enter a city name, a specific street address, or a postal code.

3. Click the "Search" button. The application will fetch the weather information for the provided address and display it on the page.

4. You will see details such as the current temperature, high and low temps, wind speed, and weather description.

5. To retrieve weather information for another address, simply enter a new address in the input field and click the "Search" button again.

## License

Is It Hot Or Cold? is open-source software licensed under the [MIT License](LICENSE). You are free to modify and distribute this software according to the terms of the license.

## Acknowledgments

- Is It Hot Or Cold? utilizes the following APIs:
  - OpenWeatherMap (https://openweathermap.org/)
