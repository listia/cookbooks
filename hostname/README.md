Hostname Cookbook
=================
Change hostname

Attributes
----------

#### hostname::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hostname']['name']</tt></td>
    <td>String</td>
    <td>Name for the host</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

Usage
-----
#### hostname::default
Include `hostname` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hostname]"
  ]
}
```
