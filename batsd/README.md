Batsd Cookbook
=================
Install and run batsD server/receiver

Dependencies
----------

* Ruby > 1.9.2
* [`git cookbook`](https://github.com/opscode-cookbooks/git)

Attributes
----------

#### batsd::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>["batsd"]["version"]</tt></td>
    <td>String</td>
    <td>Version reference from [batsd repository](https://github.com/noahhl/batsd)</td>
    <td><tt>v0.1.1</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["log_dir"]</tt></td>
    <td>String</td>
    <td>Log directory</td>
    <td><tt>/var/log/batsd</tt></td>
  </tr>
</table>

#### batsd::config
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["bind"]</tt></td>
    <td>String</td>
    <td>bind</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["receiver_port"]</tt></td>
    <td>Integer</td>
    <td>UDP port for receiving stats</td>
    <td><tt>8125</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["server_port"]</tt></td>
    <td>Integer</td>
    <td>TCP port for retriving stats</td>
    <td><tt>8127</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["root"]</tt></td>
    <td>String</td>
    <td>Diskstore file</td>
    <td><tt>tmp/statsd</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["redis"]["host"]</tt></td>
    <td>String</td>
    <td>Redis host for storing</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["redis"]["port"]</tt></td>
    <td>Integer</td>
    <td>Redis port for storing</td>
    <td><tt>6379</tt></td>
  </tr>
  <tr>
    <td><tt>["batsd"]["config"]["retentions"]</tt></td>
    <td>Hash</td>
    <td>Data at the first retention level is stored in redis; further data retentions are stored on disk</td>
    <td>
      <tt>
        ```ruby
        {
          10 =>  360, #1 hour
          60 =>  10080, #1 week
          600 => 52594 #1 year
        }
        ```
      </tt>
    </td>
  </tr>
</table>

Usage
-----
#### batsd::default
Include `batsd` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[batsd]"
  ]
}
```
