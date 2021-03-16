```python
from notebook_helper import *
```

# Template mySociety Jupyter notebook

Template with submodule for helper functions, and dockerfile to set chrome up correctly for charts. 
The chrome reference can be removed from the dockerfile if not doing any chart rendering. 

This is useful for when the readme should include some analysis of files elsewhere in the repo and you don't want to copy and paste. 

The downside of this approach is the readme.md cannot then be edited directly.

`readme.ipynb` can be set up as a notebook, which then renders itself to `readme.md`. 

Example of this approach: https://github.com/mysociety/composite_uk_imd

pandas and altair are automatically loaded as `pd` and `alt`. The mysociety theme is already initalised. 

Examples below show basic usage.

## Example table

This shows a table being rendered as markdown


```python
source = pd.DataFrame({
    'Vertical': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'],
    'Horizontal': [28, 55, 43, 91, 81, 53, 19, 87, 52]
})

source["double_h"] = source["Horizontal"] * 2

markdown_table(source)
```

| Vertical   |   Horizontal |   double_h |
|------------|--------------|------------|
| A          |           28 |         56 |
| B          |           55 |        110 |
| C          |           43 |         86 |
| D          |           91 |        182 |
| E          |           81 |        162 |
| F          |           53 |        106 |
| G          |           19 |         38 |
| H          |           87 |        174 |
| I          |           52 |        104 |


And as HTML:   


```python
source
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Vertical</th>
      <th>Horizontal</th>
      <th>double_h</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>A</td>
      <td>28</td>
      <td>56</td>
    </tr>
    <tr>
      <th>1</th>
      <td>B</td>
      <td>55</td>
      <td>110</td>
    </tr>
    <tr>
      <th>2</th>
      <td>C</td>
      <td>43</td>
      <td>86</td>
    </tr>
    <tr>
      <th>3</th>
      <td>D</td>
      <td>91</td>
      <td>182</td>
    </tr>
    <tr>
      <th>4</th>
      <td>E</td>
      <td>81</td>
      <td>162</td>
    </tr>
    <tr>
      <th>5</th>
      <td>F</td>
      <td>53</td>
      <td>106</td>
    </tr>
    <tr>
      <th>6</th>
      <td>G</td>
      <td>19</td>
      <td>38</td>
    </tr>
    <tr>
      <th>7</th>
      <td>H</td>
      <td>87</td>
      <td>174</td>
    </tr>
    <tr>
      <th>8</th>
      <td>I</td>
      <td>52</td>
      <td>104</td>
    </tr>
  </tbody>
</table>
</div>



# Example chart


```python
alt.Chart(source).mark_bar().encode(
    y='Vertical',
    x='Horizontal'
).properties(title="This is an example chart, with the right fonts")
```




    
![png](_notebook_resources/output_7_0.png)
    


