using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
namespace webhook_endpoint.Controllers;
using System.ComponentModel.DataAnnotations;

[ApiController]
[Route("[controller]")]
public class WebhookController : ControllerBase
{
    

    private readonly ILogger<WebhookController> _logger;

    public WebhookController(ILogger<WebhookController> logger)
    {
        _logger = logger;
    }

    [HttpGet(Name = "GetWeatherForecast")]
    public IActionResult Get()
    {

        try
        {
            return Ok();

            
        }
        catch (System.Exception)
        {
            return StatusCode(500, new { message="Something happens in server",StatusCode = 500 } );
            
        }


    }

    [HttpPost(Name = "GetWeatherForecast")]
    public IActionResult Post([FromBody] dynamic jsonData)
    {

        try
        {
                    
                    return Ok(jsonData);

            
        }
        catch (System.Exception)
        {
            return StatusCode(500, new { message="Something happens in server",StatusCode = 500 } );
            
        }


    }
}
