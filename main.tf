resource "aws_cloudwatch_dashboard" "Dashboard" {
    dashboard_name = "my-dashboard"
    dashboard_body = jsonencode({
    widgets = [
      {
         "type":"metric",
         "x":0,
         "y":0,
         "width":12,
         "height":6,
         "properties":{
            "metrics":[
               [ { "expression": "SELECT AVG(CPUUtilization) FROM SCHEMA(\"AWS/EC2\", InstanceId) GROUP BY InstanceId" } ],
            ],
            "view": "timeSeries",
            "stacked": false,
            "region":"us-east-1",
            "title":"EC2 Instance CPU"
         }
      },
      {
         "type":"metric",
         "x":0,
         "y":0,
         "width":12,
         "height":6,
         "properties":{
            "metrics":[
               [ { "expression": "SELECT SUM(RequestCount) FROM SCHEMA(\"AWS/ApplicationELB\", LoadBalancer, AvailabilityZone)" } ],
            ],
            "view": "timeSeries",
            "stacked": false,
            "region":"us-east-1",
            "title":"ELB"
         }
      },
      {
         "type":"metric",
         "x":0,
         "y":0,
         "width":12,
         "height":6,
         "properties":{
            "metrics":[
               [ { "expression": "SEARCH('SELECT AVG(CPUUtilization) FROM AWS/EC2 GROUP BY InstanceId ORDER BY MAX() DESC LIMIT 10', 'Average', 300)" } ],
            ],
            "view": "timeSeries",
            "stacked": false,
            "region":"us-east-1",
            "title":"MAX CPU Utilizers"
         }
      }
    ]
  })


}
