class News {
  String? id;
  String? name;
  String? description;
  String? url;

  News({
    this.id,
    this.name,
    this.description,
    this.url,
  });
}

List<News> newsList = [
  News(id: "bleacher-report", name: "Bleacher Report", description: "Sports journalists and bloggers covering NFL, MLB, NBA, NHL, MMA, college football and basketball, NASCAR, fantasy sports and more. News, photos, mock drafts, game scores, player profiles and more!", url: "http://www.bleacherreport.com"),
  News(id: "espn", name: "ESPN", description: "ESPN has up-to-the-minute sports news coverage, scores, highlights and commentary for NFL, MLB, NBA, College Football, NCAA Basketball and more.", url:"http://www.bleacherreport.com"),
  News(id: "espn-cric-info", name: "ESPN Cric Info", description: "ESPN Cricinfo provides the most comprehensive cricket coverage available including live ball-by-ball commentary, news, unparalleled statistics, quality editorial comment and analysis.", url: "http://espn.go.com"),
  News(id: "fox-sports", name: "Fox Sports", description: "Find live scores, player and team news, videos, rumors, stats, standings, schedules and fantasy games on FOX Sports.", url: "http://www.foxsports.com"),
  News(id: "nfl-news", name: "NFL News", description: "The official source for NFL news, schedules, stats, scores and more.", url: "http://www.nfl.com/news"),
  News(id: "nhl-news", name: "nhl-news", description: "The most up-to-date breaking hockey news from the official source including interviews, rumors, statistics and schedules.", url: "https://www.nhl.com/news"),
];
