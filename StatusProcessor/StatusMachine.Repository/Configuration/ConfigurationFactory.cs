using Microsoft.Extensions.Configuration;

namespace StatusMachine.Infra.Configuration
{
    public class ConfigurationFactory
    {
        public static IConfigurationRoot Create(string path)
        {
            return new ConfigurationBuilder()
             .SetBasePath(path)
             .AddJsonFile("appSettings.json")
             .Build();
        }
    }
}
