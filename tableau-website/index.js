const url =
  "https://public.tableau.com/views/Consumptionaveragestime0012/Dashboard1?:embed=y&:display_count=yes&:origin=viz_share_link";
const urlheating1 =
  "https://public.tableau.com/views/Groceriesheatingaveragecompare/Dashboard3?:embed=y&:display_count=yes&publish=yes&:origin=viz_share_link";
const urlheating2 =
  "https://public.tableau.com/views/Groceriesheatingaveragecompare2/Dashboard4?:embed=y&:display_count=yes&publish=yes&:origin=viz_share_link";
const urlheating3 =
  "https://public.tableau.com/views/Groceriesheatingaveragecompare3/Dashboard5?:embed=y&:display_count=yes&publish=yes&:origin=viz_share_link";
const urlheatLassi =
  "https://public.tableau.com/views/groceryHeatingsGraph/Dashboard1?:embed=y&:display_count=yes&:origin=viz_share_link";
const multidata =
  "https://public.tableau.com/views/MultiDataVisualization/Dashboard2?:embed=y&:display_count=yes&:origin=viz_share_link";
let vizList = [
  multidata,
  urlheatLassi,
  url,
  urlheating1,
  urlheating2,
  urlheating3
];
let viz,
  vizLen = vizList.length,
  vizCount = 0;

function createViz(vizPlusMinus) {
  let vizDiv = document.getElementById("vizContainer"),
    options = {
      width: "100%",
      height: "90vh",
      hideTabs: true,
      hideToolbar: true
    };

  vizCount = vizCount + vizPlusMinus;

  if (vizCount >= vizLen) {
    // Keep the vizCount in the bounds of the array index.
    vizCount = 0;
  } else if (vizCount < 0) {
    vizCount = vizLen - 1;
  }

  if (viz) {
    // If a viz object exists, delete it.
    viz.dispose();
  }

  let vizURL = vizList[vizCount];
  viz = new tableau.Viz(vizDiv, vizURL, options);
}
