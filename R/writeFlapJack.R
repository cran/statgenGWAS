# #' Write FlapJack format
# #' 
# #' Write gData object to Flapjack format.
# #' 
# #' @param gData An object of class \code{gData}.
# #' @param outFileMap A character string, the full path to the output map file.
# #' @param outFileGeno A character string, the full path to the output genotype
# #' file.
# #'
# #' @return No output. Output files are written to a folder.
# #'  
# #' @importFrom utils write.table
# #' @export
# writeFlapjack <- function(gData,
#                           outFileMap,
#                           outFileGeno) {
#   map <- gData$map
#   markers <- gData$markers
#   ## Write map file.
#   cat(file = outFileMap, "# fjFile = MAP\n")
#   write.table(map, file = outFileMap,
#               quote = FALSE, sep = "\t", na = "-", row.names = TRUE,
#               col.names = FALSE, append = TRUE)
#   ## Write marker file.
#   cat(file = outFileGeno, "# fjFile = GENOTYPE\n\t")
#   cat(colnames(markers), file = outFileGeno, sep = "\t", append = TRUE)
#   cat("\n", file = outFileGeno, append = TRUE)
#   write.table(markers, file = outFileGeno,
#               quote = FALSE, sep = "\t", na = "-", row.names = TRUE,
#               col.names = FALSE, append = TRUE)
# }
