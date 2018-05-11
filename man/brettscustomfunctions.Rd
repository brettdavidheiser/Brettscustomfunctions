\name{Brettscustomfunctions}
\alias{Brettscustomfunctions}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Several clumped fuctions to be used in combo with isoreader
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
smallflatlist takes a isoreader obj and pass back a flatlist. The ClumpedbyCyc takes a isoreader obj and pass back a cyc by cyc flatlist
}
\usage{
Brettscustomfunctions(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{isoreader.obj}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
  library(isoreader)
  did_files <- iso_read_dual_inlet(folder, cache = TRUE, quiet = FALSE, read_vendor_data_table = TRUE)
  did_files <- iso_omit_files_with_problems(did_files)
  flatlist.Cyc <- clumpedbyCyc(rawdata)

--------------------------------------------------
  library(isoreader)
  did_files <- iso_read_dual_inlet(folder, cache = TRUE, quiet = FALSE, read_vendor_data_table = TRUE)
  did_files <- iso_omit_files_with_problems(did_files)

  alldata=did_files \%>\%
  iso_get_file_info()  \%>\%
  # pick favorite file info fields
  select(file_id, `Analysis`, `Identifier 1`, `Preparation`,`Method`, `measurement_info` )
  preflatlist <-lapply(CIDSdata, '[[', "lineofsmallflatlist")  \%>\% bind_rows()  \%>\%
  isoreader:::unnest_aggregated_data_frame()
    sampleflatlist <- preflatlist  \%>\%
  arrange(Analysis)  \%>\%
  mutate(
    new_sample =  Preparation != c("", head(Preparation, -1)) | Analysis != c("", as.integer(head(Analysis, -1)) +1 ) |       Identifier1 != c("", head(Identifier1,-1)), #
    batch = cumsum(new_sample)
    )  \%>\%
  group_by(batch)  \%>\% mutate(id = row_number())  \%>\%  add_tally()

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
