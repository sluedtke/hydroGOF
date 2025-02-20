% File wNSE.Rd
%% Part of the hydroGOF R package, http://www.rforge.net/hydroGOF/ ; 
%%                                 http://cran.r-project.org/web/packages/hydroGOF/
%% Copyright 2011-2016 Mauricio Zambrano-Bigiarini
%% Distributed under GPL 2 or later


\name{wNSE}
\Rdversion{1.1}
\alias{wNSE}
\alias{wNSE.default}
\alias{wNSE.matrix}
\alias{wNSE.data.frame}
\alias{wNSE.zoo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Weighted Nash-Sutcliffe efficiency
}
\description{
Weighted Nash-Sutcliffe efficiency between \code{sim} and \code{obs}, with treatment of missing values. \cr
}
\usage{
wNSE(sim, obs, ...)

\method{wNSE}{default}(sim, obs, na.rm=TRUE, ...)

\method{wNSE}{data.frame}(sim, obs, na.rm=TRUE, ...)

\method{wNSE}{matrix}(sim, obs, na.rm=TRUE, ...)

\method{wNSE}{zoo}(sim, obs, na.rm=TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sim}{
numeric, zoo, matrix or data.frame with simulated values
}
  \item{obs}{
numeric, zoo, matrix or data.frame with observed values
}
  \item{na.rm}{
a logical value indicating whether 'NA' should be stripped before the computation proceeds. \cr
When an 'NA' value is found at the i-th position in \code{obs} \bold{OR} \code{sim}, the i-th value of \code{obs} \bold{AND} \code{sim} are removed before the computation.
}
  \item{\dots}{
further arguments passed to or from other methods.
}
}
\details{

\deqn{ wNSE = 1 -\frac { \sum_{i=1}^N { O_i * (S_i - O_i )^2 } } { \sum_{i=1}^N {  O_i * ( O_i - \bar{O} )^2 } }  }{%
wNSE = 1 -  sum ( obs * ( obs - sim ) ^2 ) / sum ( obs * ( obs - mean ( obs ) ) ^2 )}
}

\value{
Weighted Nash-Sutcliffe efficiency between \code{sim} and \code{obs}. \cr

If \code{sim} and \code{obs} are matrixes, the returned value is a vector, with the relative Nash-Sutcliffe efficiency between each column of \code{sim} and \code{obs}.
}
\references{
\cite{Hundecha, Y. and Merz, B. (2012), Exploring the Relationship between Changes in Climate and Floods Using a Model-Based Analysis, Water Resour. Res., 48(4), 1-21, 10.1029/2011WR010527}. 
}
\author{
Mauricio Zambrano Bigiarini <mzb.devel@gmail.com>
}
\note{
\code{obs} and \code{sim} has to have the same length/dimension \cr

The missing values in \code{obs} and \code{sim} are removed before the computation proceeds, and only those positions with non-missing values in \code{obs} and \code{sim} are considered in the computation \cr

If some of the observed values are equal to zero (at least one of them), this index can not be computed.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{NSE}}, \code{\link{mNSE}}, \code{\link{rNSE}}, \code{\link{gof}}, \code{\link{ggof}}
}
\examples{
sim <- 1:10
obs <- 1:10
wNSE(sim, obs)

sim <- 2:11
obs <- 1:10
wNSE(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the 'wNSE' for the "best" (unattainable) case
wNSE(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new 'wNSE'
wNSE(sim=sim, obs=obs)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
