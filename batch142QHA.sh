#!/bin/bash
#Script to test if can submit 500 jobs in Thomas queue

hdir=`pwd`
qhaDirs="qha_4.65837a qha_4.685a qha_4.730a qha_4.759a"
#Rest already done or running on CX2
dispList="disp-000 disp-001 disp-002 disp-003 disp-004 disp-005 disp-006 disp-007 disp-008 disp-009 disp-010 disp-011 disp-012 disp-013 disp-014 disp-015 disp-016 disp-017 disp-018 disp-019 disp-020 disp-021 disp-022 disp-023 disp-024 disp-025 disp-026 disp-027 disp-028 disp-029 disp-030 disp-031 disp-032 disp-033 disp-034 disp-035 disp-036 disp-037 disp-038 disp-039 disp-040 disp-041 disp-042 disp-043 disp-044 disp-045 disp-046 disp-047 disp-048 disp-049 disp-050 disp-051 disp-052 disp-053 disp-054 disp-055 disp-056 disp-057 disp-058 disp-059 disp-060 disp-061 disp-062 disp-063 disp-064 disp-065 disp-066 disp-067 disp-068 disp-069 disp-070 disp-071 disp-072 disp-073 disp-074 disp-075 disp-076 disp-077 disp-078 disp-079 disp-080 disp-081 disp-082 disp-083 disp-084 disp-085 disp-086 disp-087 disp-088 disp-089 disp-090 disp-091 disp-092 disp-093 disp-094 disp-095 disp-096 disp-097 disp-098 disp-099 disp-100 disp-101 disp-102 disp-103 disp-104 disp-105 disp-106 disp-107 disp-108 disp-109 disp-110 disp-111 disp-112 disp-113 disp-114 disp-115 disp-116 disp-117 disp-118 disp-119 disp-120 disp-121 disp-122 disp-123 disp-124 disp-125 disp-126 disp-127 disp-128 disp-129 disp-130 disp-131 disp-132 disp-133 disp-134 disp-135 disp-136 disp-137 disp-138 disp-139 disp-140 disp-141 disp-142 disp-143 disp-144 disp-145 disp-146 disp-147 disp-148 disp-149 disp-150 disp-151 disp-152 disp-153 disp-154 disp-155 disp-156 disp-157 disp-158 disp-159 disp-160 disp-161 disp-162 disp-163 disp-164 disp-165 disp-166 disp-167 disp-168 disp-169 disp-170 disp-171 disp-172 disp-173 disp-174 disp-175 disp-176 disp-177 disp-178 disp-179 disp-180 disp-181 disp-182 disp-183 disp-184 disp-185 disp-186 disp-187 disp-188 disp-189 disp-190 disp-191 disp-192 disp-193 disp-194 disp-195 disp-196 disp-197 disp-198 disp-199 disp-200 disp-201 disp-202 disp-203 disp-204 disp-205 disp-206 disp-207 disp-208"

for j in $qhaDirs; do 
  for i in $dispList; do 
    cd $j/$i
    cp ../../qhaSUBstuff/* .
    cp ../../qha142.pbs .
    sed -i 's/xxNAMExx/Job'$i'/g' qha142.pbs
    echo "im in" `pwd`
    qsub qha142.pbs
    cd $hdir
  done
done
