.. _bigip_policy_rule:


bigip_policy_rule - Manage LTM policy rules on a BIG-IP
+++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.5


.. contents::
   :local:
   :depth: 2


Synopsis
--------

* This module will manage LTM policy rules on a BIG-IP.


Requirements (on host that executes module)
-------------------------------------------

  * f5-sdk >= 3.0.0
  * BIG-IP >= v12.1.0


Options
-------

.. raw:: html

    <table border=1 cellpadding=4>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                <tr><td rowspan="2">actions<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td><td></td>
    <td> <div>The actions that you want the policy rule to perform.</div><div>The available attributes vary by the action, however, each action requires that a <code>type</code> be specified.</div><div>These conditions can be specified in any order. Despite them being a list, the BIG-IP does not treat their order as anything special.</div><div>Available <code>type</code> values are <code>forward</code>.</div>    </tr>
    <tr>
    <td colspan="5">
    <table border=1 cellpadding=4>
    <caption><b>Dictionary object actions</b></caption>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                    <tr><td>type<br/><div style="font-size: small;"></div></td>
        <td>yes</td>
        <td></td>
                <td><ul><li>forward</li><li>enable</li><li>ignore</li></ul></td>
                <td><div>The action type. This value controls what below options are required.</div><div>When <code>type</code> is <code>forward</code>, will associate a given <code>pool</code> with this rule.</div><div>When <code>type</code> is <code>enable</code>, will associate a given <code>asm_policy</code> with this rule.</div><div>When <code>type</code> is <code>ignore</code>, will remove all existing actions from this rule.</div>        </td></tr>
                    <tr><td>asm_policy<br/><div style="font-size: small;"></div></td>
        <td>no</td>
        <td></td>
                <td></td>
                <td><div>ASM policy to enable.</div><div>This parameter is only valid with the <code>enable</code> type.</div>        </td></tr>
                    <tr><td>pool<br/><div style="font-size: small;"></div></td>
        <td>no</td>
        <td></td>
                <td></td>
                <td><div>Pool that you want to forward traffic to.</div><div>This parameter is only valid with the <code>forward</code> type.</div>        </td></tr>
        </table>
    </td>
    </tr>
        </td></tr>
                <tr><td rowspan="2">conditions<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td></td><td></td>
    <td> <div>A list of attributes that describe the condition.</div><div>See suboptions for details on how to construct each list entry.</div><div>The ordering of this list is important, the module will ensure the order is kept when modifying the task.</div><div>The suboption options listed below are not required for all condition types, read the description for more details.</div><div>These conditions can be specified in any order. Despite them being a list, the BIG-IP does not treat their order as anything special.</div>    </tr>
    <tr>
    <td colspan="5">
    <table border=1 cellpadding=4>
    <caption><b>Dictionary object conditions</b></caption>
    <tr>
    <th class="head">parameter</th>
    <th class="head">required</th>
    <th class="head">default</th>
    <th class="head">choices</th>
    <th class="head">comments</th>
    </tr>
                    <tr><td>path_begins_with_any<br/><div style="font-size: small;"></div></td>
        <td>no</td>
        <td></td>
                <td></td>
                <td><div>A list of strings of characters that the HTTP URI should start with.</div><div>This parameter is only valid with the <code>http_uri</code> type.</div>        </td></tr>
                    <tr><td>type<br/><div style="font-size: small;"></div></td>
        <td>yes</td>
        <td></td>
                <td><ul><li>http_uri</li><li>all_traffic</li></ul></td>
                <td><div>The condition type. This value controls what below options are required.</div><div>When <code>type</code> is <code>http_uri</code>, will associate a given <code>path_begins_with_any</code> list of strings with which the HTTP URI should begin with. Any item in the list will provide a match.</div><div>When <code>type</code> is <code>all_traffic</code>, will remove all existing conditions from this rule.</div>        </td></tr>
        </table>
    </td>
    </tr>
        </td></tr>
                <tr><td>name<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The name of the rule.</div>        </td></tr>
                <tr><td>partition<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>Common</td>
        <td></td>
        <td><div>Device partition to manage resources on.</div>        </td></tr>
                <tr><td>policy<br/><div style="font-size: small;"></div></td>
    <td>yes</td>
    <td></td>
        <td></td>
        <td><div>The name of the policy that you want to associate this rule with.</div>        </td></tr>
                <tr><td>state<br/><div style="font-size: small;"></div></td>
    <td>no</td>
    <td>present</td>
        <td><ul><li>present</li><li>absent</li></ul></td>
        <td><div>When <code>present</code>, ensures that the key is uploaded to the device. When <code>absent</code>, ensures that the key is removed from the device. If the key is currently in use, the module will not be able to remove the key.</div>        </td></tr>
        </table>
    </br>



Examples
--------

 ::

    
    - name: Create policies
      bigip_policy:
        name: Policy-Foo
        state: present
      delegate_to: localhost

    - name: Add a rule to the new policy
      bigip_policy_rule:
        policy: Policy-Foo
        name: rule3
        conditions:
          - type: http_uri
            path_begins_with_any: /ABC
        actions:
          - type: forward
            pool: pool-svrs

    - name: Add multiple rules to the new policy
      bigip_policy_rule:
        policy: Policy-Foo
        name: "{{ item.name }}"
        conditions: "{{ item.conditions }}"
        actions: "{{ item.actions }}"
      loop:
        - name: rule1
          actions:
            - type: forward
              pool: pool-svrs
          conditions:
            - type: http_uri
              path_starts_with: /euro
        - name: rule2
          actions:
            - type: forward
              pool: pool-svrs
          conditions:
            - type: http_uri
              path_starts_with: /HomePage/

    - name: Remove all rules and confitions from the rule
      bigip_policy_rule:
        policy: Policy-Foo
        name: rule1
        conditions:
          - type: all_traffic
        actions:
          - type: ignore


Return Values
-------------

Common return values are `documented here <http://docs.ansible.com/ansible/latest/common_return_values.html>`_, the following are the fields unique to this module:

.. raw:: html

    <table border=1 cellpadding=4>
    <tr>
    <th class="head">name</th>
    <th class="head">description</th>
    <th class="head">returned</th>
    <th class="head">type</th>
    <th class="head">sample</th>
    </tr>

        <tr>
        <td> conditions </td>
        <td> The new list of conditions applied to the rule. </td>
        <td align=center> changed </td>
        <td align=center> complex </td>
        <td align=center> hash/dictionary of values </td>
    </tr>
            <tr>
        <td> description </td>
        <td> The new description of the rule. </td>
        <td align=center> changed </td>
        <td align=center> string </td>
        <td align=center> My rule </td>
    </tr>
            <tr>
        <td> actions </td>
        <td> The new list of actions applied to the rule </td>
        <td align=center> changed </td>
        <td align=center> complex </td>
        <td align=center> hash/dictionary of values </td>
    </tr>
        
    </table>
    </br></br>

Notes
-----

.. note::
    - Requires the f5-sdk Python package on the host. This is as easy as pip install f5-sdk.
    - For more information on using Ansible to manage F5 Networks devices see https://www.ansible.com/ansible-f5.



Status
~~~~~~

This module is flagged as **preview** which means that it is not guaranteed to have a backwards compatible interface.


Support
~~~~~~~

This module is community maintained without core committer oversight.

For more information on what this means please read :doc:`/usage/support`


For help developing modules, should you be so inclined, please read :doc:`Getting Involved </development/getting-involved>`, :doc:`Writing a Module </development/writing-a-module>` and :doc:`Guidelines </development/guidelines>`.